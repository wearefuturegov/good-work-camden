class ContactController < ApplicationController
  def show
    render template: "contact/contact"
  end

  def thankyou
    email1 = ContactMailer.with(user: params).new_message.deliver_now
    email = ResidentMailer.with(user: params).contact_confirmation.deliver_now
    render template: "contact/thankyou"
  end 
end
