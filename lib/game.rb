
#beat class which is an odd number of slots after
CHOICES = [:Scissors, :Paper, :Rock]
# CHOICES = [:Scissors, :Paper, :Rock, :Lizard, :Spock]


class Player 
  attr_reader :name
  attr_accessor :choice
  
  def initialize(player_name)
    @name = player_name
  end

  def random_choice
    choice = CHOICES.sample
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
    return nil if @players.map(&:choices_index).uniq.count == 1
    player1 = players.first
    player2 = players.last
    choices_rotate_player1 = CHOICES.rotate(player1.choices_index)
    diff = choices_rotate_player1.index(player2.choice)
    return player2 if diff % 2 == 0
    return player1
  end

    # return @players.first if (players.first.choices_index - players.last.choices_index)%2 == 1
    # players.last



end




# def game_outcome(player1, player2)
#   case true
#   when player1.choice == player2.choice
#     nil #draw
#   when (CHOICES.index(player1.choice) - CHOICES.index(player2.choice))%2 == 1
#     player1
#   else
#     player2
#   end
# end
#     