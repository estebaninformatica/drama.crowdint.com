When /^I click on "(.*?)"$/ do |link_text|
  click_link link_text
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |field, text|
  fill_in field, with: text
end

When /^I press "(.*?)"$/ do |button_text|
  click_button button_text
end

Then /^I should see "(.*?)"$/ do |text|
  assert page.has_content?(text), "Current page has no content '#{text}'"
end

Then /^I should not see "(.*?)"$/ do |text|
  assert page.has_no_content?(text), "Current page still has content '#{text}'"
end

Given /^I check "(.*?)"$/ do |label|
  check label
end

Given /^I uncheck "(.*?)"$/ do |label|
  uncheck label
end

Then /^"(.*?)" should be checked$/ do |label|
  element = find_field(label)
  element.should be_checked
end

Then /^"(.*?)" should be unchecked$/ do |label|
  element = find_field(label)
  element.should_not be_checked
end
