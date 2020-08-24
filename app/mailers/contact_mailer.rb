class ContactMailer < Mail::Notify::Mailer
  default from: ENV['FROM_EMAIL_ADDRESS']

  def new_message
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: ENV['CAMDEN_CONTACT_EMAIL'],
      subject: 'Good Work Camden contact form message'
    )
  end

end