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

