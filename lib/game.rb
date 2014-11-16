
CHOICES = %i{Rock Paper Scissors}
WINNERS = {:Rock => :Scissors, :Paper => :Rock, :Scissors => :Paper}

def losers 
  WINNERS.invert
end