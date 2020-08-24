class AdviserMailer < Mail::Notify::Mailer
  default from: ENV['FROM_EMAIL_ADDRESS']

  def new_resident
    @user = params[:user]
    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: ENV['CAMDEN_ADVISOR_EMAIL'],
      subject: 'Good Work Camden'
    )
  end
end