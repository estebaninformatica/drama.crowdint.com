Then /^user should be subscribed to emails$/ do
  @user.reload
  @user.subscribed.should be_true
end

Then /^user should not be subscribed to emails$/ do
  @user.reload
  @user.subscribed.should be_false
end

Given /^the user is subscribed to notifications$/ do
  @user.update_attribute :subscribed, true
end
