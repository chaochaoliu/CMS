class UserMailer < ApplicationMailer
  default from: "admin@example.com"
  layout 'mailer'

  def welcome_email(profile)
    @profile = profile
    mail(to: @profile.user.email, subject: 'Welcome to Church Management System')
  end
end
