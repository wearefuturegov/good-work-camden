class ContactMailer < Mail::Notify::Mailer

  def new_message
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: ENV['CAMDEN_CONTACT_EMAIL'],
      subject: 'Good Work Camden contact form message',
      reply_to_id: ENV['CAMDEN_CONTACT_EMAIL']
    )
  end

end