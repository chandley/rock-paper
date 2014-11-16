
# CHOICES = %i{Rock Paper Scissors}
WINNERS = {:Rock => :Scissors, :Paper => :Rock, :Scissors => :Paper}

def losers 
  WINNERS.invert
end

def choices
  WINNERS.keys.uniq
end
    
def random_choice
  choices.sample
end

def game_outcome(player_choice, computer_choice)
  case true
  when WINNERS[player_choice.to_sym] == computer_choice
    :player_wins
  when losers[player_choice.to_sym] == computer_choice
    :player_loses
  else
    :draw
  end
end
    