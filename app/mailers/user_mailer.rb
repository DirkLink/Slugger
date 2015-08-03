class UserMailer < ApplicationMailer
  default from: 'notifications@sluggr.herokuapp.com'

  def invite_email user, sender
    @sender = sender
    @recipient = user
    @confirm_url = "https://sluggr-api.herokuapp.com/group/confirm?inviter=#{sender.id}&invitee=#{user.id}"
    @deny_url = "https://sluggr-api.herokuapp.com/group/deny"
    mail(to: @recipient.email, subject: "#{@sender.email} has invited you to join his group.")
  end
end
