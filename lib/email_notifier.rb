class EmailNotifier
  def self.recipients
    User.subscribed.collect(&:email)
  end

  def self.drama_created(drama)
    recipients.each do |email|
      NotificationMailer.drama_created(email, drama).deliver
    end
  end
end
