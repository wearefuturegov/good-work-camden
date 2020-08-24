class Mailer < Mail::Notify::Mailer
    default from: ENV['FROM_EMAIL_ADDRESS']
   
    def adviser_email
      @user = params[:user]
      view_mail(
        ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
        to: ENV['CAMDEN_ADVISOR_EMAIL'],
        subject: 'Good Work Camden'
      )
    end

    def adviser_confirmation_email
      @user = params[:user]
      view_mail(
        ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
        to: @user[:email],
        subject: 'Camden employment advisor contact'
      )
    end

    def results_email
      @user = params[:user]
      @services = params[:services]
      view_mail(
        ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
        to: @user[:email],
        subject: 'Good Work Camden'
      )
    end

    def contact_email
      @user = params[:user]
      view_mail(
        ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
        to: ENV['CAMDEN_CONTACT_EMAIL'],
        subject: 'Good Work Camden contact form message'
      )
    end

    def contact_confirmation_email
      @user = params[:user]
      view_mail(
        ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
        to: @user[:email],
        subject: "Your message to Camden's employment support service has been sent"
      )
    end
  end