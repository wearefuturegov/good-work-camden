class ResidentMailer < Mail::Notify::Mailer
  default from: ENV['FROM_EMAIL_ADDRESS']

  def confirmation_of_adviser
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: @user[:email],
      subject: 'Camden employment advisor contact'
    )
  end

  def contact_confirmation
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: @user[:email],
      subject: "Your message to Camden's employment support service has been sent"
    )
  end

  def results
    @user = params[:user]
    @services = params[:services]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: @user[:email],
      subject: 'Good Work Camden'
    )
  end
end
