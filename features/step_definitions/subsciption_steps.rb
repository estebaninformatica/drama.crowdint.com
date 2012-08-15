Then /^user should be subscribed to emails$/ do
  @user.reload
  @user.subscribed.should be_true
end

Then /^user should not be subscribed to emails$/ do
  @user.reload
  @user.subscribed.should be_false
end
