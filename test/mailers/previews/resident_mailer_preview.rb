class ResidentMailerPreview < ActionMailer::Preview
  def confirmation_of_adviser
    user_params = {"name"=>"Testy Test"}
    ResidentMailer.with(user: user_params.symbolize_keys).confirmation_of_adviser
  end

  def contact_confirmation
    user_params = {"name"=>"Testy Test"}
    ResidentMailer.with(user: user_params.symbolize_keys).contact_confirmation
  end

  def results
    user_params = {"name"=>"Testy Test"}
    ResidentMailer.with(user: user_params.symbolize_keys).contact_confirmation
  end
end