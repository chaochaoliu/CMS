class UserMailer < ApplicationMailer
  default from: "admin@example.com"
  layout 'mailer'

  def welcome_email(profile)
    @profile = profile
    # mail(to: @profile.user.email, subject: 'Welcome to Church Management System')
     mail(to: 'liuchao200240@gmail.com', subject: 'Welcome to Church Management System')

  end

  def notice_email(message,receiver)
      @message = message
      mail(to: receiver, subject: @message.subject) 
  end

   def email_sermon_reflection_to_preacher(preacher, sermon_reflection)
      @sermon_reflection = sermon_reflection
      mail(to: preacher.email, subject: @sermon_reflection.title) 
  end

  def email_suggestion_to_pastor(pastor_email, suggestion)
      @suggestion = suggestion
      mail(to: pastor_email.email, subject: @suggestion.title) 
  end

  def email_suggestion_to_staff(staff_email, suggestion)
      @suggestion = suggestion
      mail(to: staff_email.email, subject: @suggestion.title)  
  end
end
