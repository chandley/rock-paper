Feature: Playing Rock Paper Scissors
  Once I have set up my user
  I want to play the game

  Scenario: Arriving at the play game page
    Given I am playing the game
    When I have not made a choice
    Then I should see a choice of choose Rock, Paper or Scissors

  Scenario: I make a choice 'Rock'
    When I am playing the game
    When I click on 'rock'
    Then I should see a Game Result page
