require "spec_helper"

describe NotificationMailer do
  describe "#drama_created" do
    let(:drama) { mock_model Drama, description: 'There is no more coffee' }

    it "sends the email to the specified user" do
      email = NotificationMailer.drama_created('test@test.com', drama).deliver
      ActionMailer::Base.deliveries.should_not be_empty

      email.to.should == %w(test@test.com)
      email.body.should =~ /There is no more coffee/
    end
  end
end
