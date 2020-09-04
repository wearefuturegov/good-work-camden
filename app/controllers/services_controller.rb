require 'date'

class ServicesController < ApplicationController

  def show
    @template= ""
    #REMEMBER - Step is a string in the URL params so needs quotes or .to_s whenever you assign to it
    @step = "1"
    @errors = Hash.new
    @questions = YAML.load_file('config/questions.yml')
    if params[:step].present?
      @step = (params[:step].to_i + 1).to_s
    end

    # Check we have a valid postcode
    if params[:loc].present? then
      @postcode = UKPostcode.parse(params[:loc].upcase)
      if @postcode.valid?
        url = URI.encode("https://api.postcodes.io/postcodes/#{@postcode}")
        response = HTTParty.get(url)
        if response["status"] == 200 && response["result"]["admin_district"] == "Camden"
        else
          @errors["loc"] = "Not a Camden postcode"
          @step = "1"
        end
      else
        @errors["loc"] = "Not a Camden postcode"
        @step = "1"
      end
    end



    @persist = params.except('step')

    #Check question pre-requistes have been met
    case @step
    when "3"
      if !params[:sprt].present? then
        @errors["sprt"] = "Support requirements not specified"
        @step = "2"
      end
    end

    #Check DOB is valid
    if params[:dob_day].present? then
      day = params[:dob_day].to_i
      month = params[:dob_month].to_i
      year = params[:dob_year].to_i
      @age = age(day, month, year)
      if (@age < 16) then
        @errors["dob_year"] = "You have told us you are too young to use this service (" + @age.to_s  + ")"
        @step = "4"
      end
      if (@age > 125) then
          @errors["dob_year"] = "You have told us you are over " + @age.to_s + " years old. Please enter the year in the format DD/MM/YYYY."
          @step = "4"
      end
    end

    case @step
    when "2"
      @sprt = params[:sprt].present? ? params[:sprt] : []
      @template = "services/questions/support/"
    when "3"
    #   @employ = params[:emp].present? ? params[:emp] : []
    #   @house = params[:hou].present? ? params[:hou] : []
    #   @template = "services/questions/about_you/"
    # when "4"
    #   @template = "services/questions/additional/"
    # when "5"
      @template = "services/questions/type/"
    when "4"
      params[:sprt] = params[:sprt].split(" ")
      if params[:type] == "adviser"
        @template = "services/adviser/"
      elsif params[:type] == "search"
        @filters = []

        # ADD SUPPORT TO FILTERS
        if params[:sprt].present? then
          f = params[:sprt].split(' ')
          f.each do |s|
            @filters.append(s)
          end
        end

        # ADD GENDER TO FILTERS
        if params[:gender].present? then
            @filters.append(params[:gender])
        end
        # ADD ETHNICITY TO FILTERS
        if params[:ethnic].present? then
            @filters.append(params[:ethnic])
        end
        # ADD EMPLOYMENT TO FILTERS
        if params[:emp].present? then
          f = params[:emp].split(' ')
          f.each do |s|
            @filters.append(s)
          end
        end
        # ADD HOUSING TO FILTERS
        if params[:hou].present? then
          f = params[:hou].split(' ')
          f.each do |s|
            @filters.append(s)
          end
        end

        # Ignore exludes for now
        # @excludes = Service.joins(:tags).where({"tags.tag": @filters, "service_tags.excluded": 1}).distinct
        # @services = Service.joins(:tags).where.not({"id": @excludes.ids}).distinct.limit(5).near(params[:loc])
        tags =  @questions["type_of_support"]["answers"].select{|answer| params[:sprt].include? answer["value"]}.map{|answer| answer["tags"].map{|tag| tag["tag"]}}.flatten
        @services = Service.where.not(postcode: nil).joins(:tags).where("tags.tag": tags).distinct.near(@postcode.to_s).limit(5).includes('tags')

        if @services.size < 5
          national_services = Service.where(postcode: nil).joins(:tags).where("tags.tag": tags).distinct
          @services = @services + national_services
          @services = @services.take(5)
        end

        @template = "services/list/"
      end
    else
      @template = "services/questions/location/"
    end
    render template: @template
  end

  def thankyou
    params[:sprt] = params[:sprt].split(" ")
    response = HTTParty.post("https://api.airtable.com/v0/#{ENV["AIRTABLE_BASE_ID"]}/Applications", 
      body: {
        records: [
          fields: params.permit(
            :name,
            :email,
            :phone,
            :type,
            :dob_day,
            :dob_month,
            :dob_year,
            :sprt,
            :loc
          )
        ]
      }.to_json,
      headers: {
        "Authorization": "Bearer #{ENV["AIRTABLE_API_KEY"]}",
        "Content-Type": "application/json"
      }
    )
    email1 = AdviserMailer.with(user: params).new_resident.deliver_now
    email2 = ResidentMailer.with(user: params).confirmation_of_adviser.deliver_now
    render template: "services/thankyou"
  end 

  def emailresults
    email = ResidentMailer.with(
      user: params, 
      referer: request.referer
    ).results.deliver_now
    render template: "services/complete"
  end 

  def details
    if params[:id].present?
      @id = params[:id]
      @service = Service.find(@id)

      @how_we_can_help = @service.tags.where(displayed: true)

      @who_is_it_for = @service.service_tags.where(required: true)


      render template: "services/details/"
    else
      redirect_to :action=>'show'
    end
  end

  def age(day, month, year)
      now = Time.now.utc.to_date
      return now.year - year - ((now.month > month || (now.month == month && now.day >= day)) ? 0 : 1)
  end

end
