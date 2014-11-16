
#beat class which is an odd number of slots after
CHOICES = [:Scissors, :Paper, :Rock]
CHOICES = [:Scissors, :Paper, :Rock, :Lizard, :Spock]


class Player 
  attr_reader :name
  attr_accessor :choice
  
  def initialize(player_name)
    @name = player_name
  end

  def random_choice
    choice = CHOICES.sample
  end

end



def game_outcome(player1, player2)
  case true
  when player1.choice == player2.choice
    nil #draw
  when (CHOICES.index(player1.choice) - CHOICES.index(player2.choice))%2 == 1
    player1
  else
    player2
  end
end
    