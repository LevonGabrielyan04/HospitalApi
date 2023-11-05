class NotificationMailer < ApplicationMailer
  def patient_notification(email, text)
    @text = text
    mail(to: email, subject: 'Уведомление о рекомендации')
  end
end