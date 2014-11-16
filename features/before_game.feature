Feature: Setting up Rock Paper Scissors game
  In order to play RPS on the web
  My player enters their name
  So we can call them by their name later
  And give them the personal touch

  Scenario: Visiting homepage for the first time
    Given I have not visited before
    When I visit the home page
    Then I should be asked for my name

  Scenario: I enter my name
    Given I am a new user
    And I visit the home page
    When I enter my name
    And I click register
    Then I should go to the play game page

  Scenario: I enter nothing
    Given I am a new user
    And I visit the home page
    When I enter nothing
    And I click register
    Then I should be asked for my name again
