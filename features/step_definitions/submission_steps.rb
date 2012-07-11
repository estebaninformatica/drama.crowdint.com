Then /^I should be on the submissions page$/ do
  assert_equal page.current_path, submissions_path
end
