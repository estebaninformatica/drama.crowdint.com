class NotificationMailer < ActionMailer::Base
  default from: "from@example.com"

  def drama_created(user)
    mail(to: user, subject: "[CROWDRAMA] A new drama has been submitted")
  end
end
