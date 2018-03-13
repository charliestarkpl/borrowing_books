class NotificationMailer < ApplicationMailer
  def error_notification
    mail to: ENV['EMAIL_ADDRESS']
  end
end
