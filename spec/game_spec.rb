require 'game'

describe 'Player' do

   let(:player) { Player.new("chris") }
  
  it 'should have a name' do
    # player = Player.new('chris')
    expect(player.name).to eq('chris')
  end

  it 'should be able to make a choice' do
    player.choice = :Rock
    expect(player.choice).to eq(:Rock)
  end

end

describe 'Game' do

  let(:player1) {double :player, :choice => :Rock}
  let(:player2) {double :player, :choice => :Scissors}

  it 'should start with no players' do
    game = Game.new
    expect(game.players.count).to eq(0)
  end

  it 'should be able to add two players' do
    game = Game.new
    2.times {game.add_player(player1)}
    expect(game.players.count).to eq(2) 
  end

  it 'rock should draw with rock' do
    game = Game.new
    game.add_player(alice = Player.new('alice'))
    game.add_player(bob = Player.new('bob'))
    alice.choice = :Rock
    bob.choice = :Rock
    expect(game.winner).to be_nil
 end

  it 'rock should beat scissors' do
    game = Game.new
    game.add_player(alice = Player.new('alice'))
    game.add_player(bob = Player.new('bob'))
    alice.choice = :Rock
    bob.choice = :Scissors
    expect(game.winner).to eq(alice)
 end

   it 'scissors should beat paper' do
    game = Game.new
    game.add_player(alice = Player.new('alice'))
    game.add_player(bob = Player.new('bob'))
    alice.choice = :Paper
    bob.choice = :Scissors
    expect(game.winner).to eq(bob)
 end


end