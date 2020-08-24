class ContactMailerPreview < ActionMailer::Preview
  def new_message
    user_params = {"name"=>"Testy Test", "email"=>"test@test.com", "message"=>"Hello!"}
    ContactMailer.with(user: user_params.symbolize_keys).new_message
  end
end