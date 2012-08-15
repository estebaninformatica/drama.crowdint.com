@javascript

Feature: Email subscriptions

  Background:
    Given I am logged in as a crowdie

  Scenario: Subscribe to emails
    Given I go to the home page
    And I click on "Subscription"
    And I check "Email Notifications"
    Then "Email Notifications" should be checked
    Then user should be subscribed to emails
    And I uncheck "Email Notifications"
    Then "Email Notifications" should be unchecked
    Then user should not be subscribed to emails

  Scenario: Persisted subscriptions
    Given the user is subscribed to notifications
    Given I go to the home page
    And I click on "Subscription"
    Then "Email Notifications" should be checked

