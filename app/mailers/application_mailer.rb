class ApplicationMailer < ActionMailer::Base
  default from: ENV['CAMDEN_CONTACT_EMAIL']
  layout "mailer"
end
