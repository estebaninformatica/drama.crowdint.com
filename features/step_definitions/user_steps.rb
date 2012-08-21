Given /^another user exists that is not subscribed to notifications$/ do
  User.create! email: 'other@test.com', subscribed: false
end

