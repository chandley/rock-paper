
#beat class which is an odd number of slots after
CHOICES = [:Scissors, :Paper, :Rock, :Lizard, :Spock]

WINNERS = { :Scissors =>  [:Paper,   :Lizard], 
            :Paper =>     [:Rock,    :Spock], 
            :Rock =>      [:Lizard,  :Scissors], 
            :Lizard =>    [:Spock,   :Paper], 
            :Spock =>     [:Scissors,:Rock]
          }


class Player 
  attr_reader :name
  attr_accessor :choice
  
  def initialize(player_name)
    @name = player_name
  end

  def random_choice!
    @choice = CHOICES.sample
    return self
  end

end

class Game
  attr_reader :players
  def initialize
    @players = []
  end

  def add_player(player)
    @players << player
  end

  def player1
    players.first
  end

  def player2
    players.last
  end

  def winner
    return nil if player1.choice == player2.choice 
    return player1 if WINNERS[player1.choice].include?(player2.choice)
    return player2
  end

end
