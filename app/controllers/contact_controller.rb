class ContactController < ApplicationController
  def show
    render template: "contact/contact"
  end

  def thankyou
    email1 = Mailer.with(user: params).contact_email.deliver_now
    email = Mailer.with(user: params).contact_confirmation_email.deliver_now
    render template: "contact/thankyou"
  end 
end
