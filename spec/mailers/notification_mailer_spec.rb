require "spec_helper"

describe NotificationMailer do
  describe "#drama_created" do
    it "sends the email to the specified user" do
      email = NotificationMailer.drama_created('test@test.com').deliver
      ActionMailer::Base.deliveries.should_not be_empty

      email.to.should == %w(test@test.com)
    end
  end
end
