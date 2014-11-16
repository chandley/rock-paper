require 'game'

describe 'Player' do

  # let(:player) { Player.new("chris") }
  
  it 'should have a name' do
    player = Player.new('chris')
    expect(player.name).to eq('chris')
  end


end