class UserMailer < ApplicationMailer
  default from: "admin@example.com"
  layout 'mailer'

  def welcome_email(profile)
    @profile = profile
    mail(to: @profile.user.email, subject: 'Welcome to Church Management System')
  end

  def notice_email(message,receiver)
      @message = message
      mail(to: receiver, subject: @message.subject) 
  end
end
