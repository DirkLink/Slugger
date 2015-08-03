class UserMailer < ApplicationMailer
  default from: 'notifications@sluggr.herokuapp.com'

  def invite_email user, sender
    @sender = sender
    @recipient = user
    @confirm_url = "https://sluggr-api.herokuapp.com/group/confirm?inviter=#{@sender.id}&invitee=#{@user.id}&Email=#{@sender.email}"
    @deny_url = "https://sluggr-api.herokuapp.com/group/deny?Email=#{@sender.email}"
    mail(to: @recipient.email, subject: "#{@sender.email} has invited you to join his group.")
  end
end
