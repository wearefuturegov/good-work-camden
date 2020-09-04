class ResidentMailer < Mail::Notify::Mailer

  def confirmation_of_adviser
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: @user[:email],
      subject: 'Camden employment advisor contact',
      reply_to_id: ENV['CAMDEN_CONTACT_EMAIL']
    )
  end

  def contact_confirmation
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: @user[:email],
      subject: "Your message to Camden's employment support service has been sent",
      reply_to_id: ENV['CAMDEN_CONTACT_EMAIL']
    )
  end

  def results
    @user = params[:user]
    @referer = URI.encode(CGI.unescape(params[:referer]))
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: @user[:email],
      subject: 'Good Work Camden',
      reply_to_id: ENV['CAMDEN_CONTACT_EMAIL']
    )
  end
end
