class AdviserMailerPreview < ActionMailer::Preview
  def new_resident
    @user = {"type"=>"adviser", "dob_day"=>"28", "dob_month"=>"10", "dob_year"=>"1990", "gender"=>"privategen", "ethnic"=>"white", "emp"=>"fte se", "hou"=>"ct", "sprt"=>["othersprt", "health-and-wellbeing"], "loc"=>"NW1 0RR", "controller"=>"services", "action"=>"show", "step"=>"5"}
    AdviserMailer.with(user: @user.symbolize_keys).new_resident
  end
end