Given /^user "(.*?)" created a drama described as "(.*?)"$/ do |email, description|
  user          = User.find_or_create_by_email email
  drama         = Drama.new description: description
  drama.creator = user
  drama.save!
end

Given /^(\d+) test users voted for "(.*?)" drama$/ do |user_count, drama|
  drama = Drama.find_by_description drama
  user_count.to_i.times do |i|
    user = User.create! email: "test#{i}@crowdint.com"
    drama.upvote_by user
  end
end
