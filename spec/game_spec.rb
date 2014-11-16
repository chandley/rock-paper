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