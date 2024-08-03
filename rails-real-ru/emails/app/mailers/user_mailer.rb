# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def account_activation
    @user = params[:user]
    mail(to: @user.email, subject: t('.subject'))
  end
end
