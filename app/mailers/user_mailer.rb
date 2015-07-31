class UserMailer < ApplicationMailer
  default from: 'notifications@sluggr.herokuapp.com'

  def invite_email user
    @sender = current_user
    @recipient = user
    @url = 'https://sluggr.herokuapp.com'
    mail(to: @@recipient.email, subject: "#{@sender.username} has invited you to join his group.")
  end
end
