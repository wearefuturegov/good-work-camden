class AdviserMailer < Mail::Notify::Mailer

  def new_resident
    @user = params[:user]
    @questions = YAML.load_file('config/questions.yml')

    view_mail(
      ENV['GOVUK_NOTIFY_TEMPLATE_ID'],
      to: ENV['CAMDEN_ADVISOR_EMAIL'],
      subject: 'Good Work Camden',
      reply_to_id: ENV['CAMDEN_CONTACT_EMAIL']
    )
  end
end