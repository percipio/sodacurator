class UserMailer < ApplicationMailer
  default from: 'hello@pmkit.co'

  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Account activation'
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: 'Account password reset'
  end
end
