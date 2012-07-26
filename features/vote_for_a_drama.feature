@javascript

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

  Scenario: When I give the final vote, the drama is published
    Given user "john@crowdint.com" created a drama described as "No more coffee"
    And the last drama happened 6 days ago
    And 9 test users voted for "No more coffee" drama
    When I go to the home page
    Then I should not see "No more coffee"
    And I should see "Our record is 0 days without drama!"
    When I click on "Vote for drama"
    And I click on "Upvote"
    Then I should be on the submissions page
    And I should not see "No more coffee"
    When I go to the home page
    Then I should see "No more coffee"
    And I should see "Our record is 6 days without drama!"

  Scenario: Drama expiration
    Given user "john@crowdint.com" created a drama described as "No more coffee"
    And user "john@crowdint.com" created a drama described as "Expired drama"
    And that drama was created 3 days ago
    When I go to the home page
    Then I should not see "Expired drama"
    When I click on "Vote for drama"
    Then I should not see "Expired drama"
    And I should see "No more coffee"

