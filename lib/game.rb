
#beat class which is an odd number of slots after
CHOICES = [:Scissors, :Paper, :Rock, :Lizard, :Spock]


class Player 
  attr_reader :name
  attr_accessor :choice
  
  def initialize(player_name)
    @name = player_name
    @choice = :Rock
  end

  def random_choice!
    @choice = CHOICES.sample
  end

  def choices_index
    CHOICES.index(choice)
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

  def winner
    return nil if players.map{|player| player.choice}.uniq.count == 1 # draw
    #return player an odd number of places in front of the other in the CHOICES array
    players.max{|p1,p2| CHOICES.rotate(p1.choices_index).index(p2.choice)%2 }
  end

end
