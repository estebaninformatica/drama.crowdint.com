Feature: Submit Drama

  Scenario:
    Given I am logged in as a crowdie
    And I am subscribed to notifications
    And another user exists that is not subscribed to notifications
    When I go to the home page
    And I click on "Submit drama"
    And I fill in "Description" with "Drama Lama, Lama, Leia"
    And I press "Create"
    Then I should be on the submissions page
    And I should see "Drama Lama, Lama, Leia"
    And an email notification should be sent only to subscribed users
