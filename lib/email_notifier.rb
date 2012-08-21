class EmailNotifier
  def self.recipients
    User.subscribed.collect(&:email)
  end

  def self.drama_created
    recipients.each do |email|
      NotificationMailer.drama_created(email).deliver
    end
  end
end
