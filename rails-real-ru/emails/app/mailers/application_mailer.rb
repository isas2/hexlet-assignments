# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'send@zabedu.ru'
  layout 'mailer'
end
