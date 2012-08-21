Then /^an email notification should be sent only to subscribed users$/ do
  ActionMailer::Base.deliveries.count.should eq(1)
  mail = ActionMailer::Base.deliveries.last
  mail.should_not be_nil
  mail.to.should include(@user.email)
end
