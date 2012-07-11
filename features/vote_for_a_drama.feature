Feature: Vote for a drama

  Background:
    Given I am logged in as a crowdie

  Scenario: Upvote a drama
    Given user "john@crowdint.com" created a drama described as "No more coffee"
    When I go to the submissions page
    Then I should see "No more coffee"
    When I click on "Upvote"
    Then I should see that "No more coffee" has 1 vote
    And I should not see the "Upvote" link for "No more coffee"

