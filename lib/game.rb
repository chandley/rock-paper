
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
  end

  def choices_index
    CHOICES.index(choice.to_sym)
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

  # def winner
  #   return nil if players.map{|player| player.choice.to_sym}.uniq.count == 1 # draw
  #   #return player an odd number of places in front of the other in the CHOICES array
  #   players.max{|p1,p2| CHOICES.rotate(p1.choices_index).index(p2.choice.to_sym)%2 }
  # end

    # def winner
    #   return nil if players.map{|player| player.choice.to_sym}.uniq.count == 1 # draw
    #   players.max{|p1,p2|  WINNERS[p1.choice.to_sym].include[p2.choice.to_sym] ? 1 : 0}
    # end

    def winner
      return nil if player1.choice == player2.choice 
      return player1 if WINNERS[player1.choice].include?(player2.choice)
      return player2
    end

end
