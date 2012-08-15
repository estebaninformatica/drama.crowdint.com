Given /^I am logged in as a crowdie$/ do
  step 'Given I am logged in as "test@crowdint.com"'
end

Given /^Given I am logged in as "(.*?)"$/ do |email|
  @user = User.create! email: email
  visit "/backdoor?email=#{email}"
end
