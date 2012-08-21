class NotificationMailer < ActionMailer::Base
  default from: "dramas@crowdint.com"

  def drama_created(user, drama)
    @drama = drama
    mail(to: user, subject: "[CROWDRAMA] A new drama has been submitted")
  end
end
