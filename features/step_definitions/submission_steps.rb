Then /^I should be on the submissions page$/ do
  assert_equal page.current_path, submissions_path
end

When /^I go to the submissions page$/ do
  visit submissions_path
end

Then /^I should see that "(.*?)" has (\d+) votes?$/ do |description, expected_votes|
  within("tr:contains('#{description}')") do
    actual_votes = find("td.votes").text
    assert_equal "#{expected_votes} votes", actual_votes
  end
end

Then /^I should not see the "(.*?)" link for "(.*?)"$/ do |link_name, description|
  within("tr:contains('#{description}')") do
    assert page.has_no_selector?("a:contains('#{link_name}')"), "The #{link_name} link is visible for '#{description}'"
  end
end
