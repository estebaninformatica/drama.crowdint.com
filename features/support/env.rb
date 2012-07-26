require 'cucumber/rails'

Capybara.default_selector = :css

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

#
# Temporarily disabled since I am not sure it works with
# Mountain Lion
#
Capybara.javascript_driver = :webkit
