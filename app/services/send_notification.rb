class SendNotification
  def call
    send_email_notification
  end

  private

  def send_email_notification
    NotificationMailer.error_notification.deliver_later
  end
end
