Given /^user "(.*?)" created a drama described as "(.*?)"$/ do |email, description|
  user          = User.find_or_create_by_email email
  drama         = Drama.new description: description
  drama.creator = user
  drama.save!
end
