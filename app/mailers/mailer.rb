class Mailer < ApplicationMailer
    default from: 'mailgun@sandbox6843066e1d98469d80e6f6d909c01786.mailgun.org'
   
    def adviser_email
      @user = params[:user]
      mail(to: ENV.get('CAMDEN_ADVISOR_EMAIL'), subject: 'Good Work Camden')
    end

    def adviser_confirmation_email
      @user = params[:user]
      mail(to: @user[:email], subject: 'Camden employment advisor contact')
    end

    def results_email
      @user = params[:user]
      @services = params[:services]
      mail(to: @user[:email], subject: 'Good Work Camden')
    end

    def contact_email
      @user = params[:user]
      mail(to: ENV.get('CAMDEN_CONTACT_EMAIL'), subject: 'Good Work Camden contact form message')
    end

    def contact_confirmation_email
      @user = params[:user]
      mail(to: @user[:email], subject: "Your message to Camden's employment support service has been sent")
    end
  end