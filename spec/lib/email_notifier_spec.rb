require 'spec_helper'
require 'email_notifier'

describe EmailNotifier do
  let (:user) { User.new email: 'test@test.com' }

  describe ".recipients" do
    it "Returns an array of subscribed emails" do
      User.should_receive(:subscribed).and_return [ user ]
      EmailNotifier.recipients.should == %w(test@test.com)
    end
  end

  describe "#drama_created" do
    let(:email) { stub }
    let(:drama) { stub }

    it "notifies all subscribed users" do
      EmailNotifier.should_receive(:recipients).and_return %w(test@test.com)
      NotificationMailer.should_receive(:drama_created).with('test@test.com', drama).
          and_return(email)
      email.should_receive :deliver
      EmailNotifier.drama_created drama
    end
  end
end
