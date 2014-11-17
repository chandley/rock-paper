require 'sinatra/base'
require_relative 'game'

class RockPaper < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }
  set :public_folder, Proc.new { File.join(root, "../public") }
  enable :sessions
  GAME = Game.new

  get '/' do
    'Please enter your name'
    erb :enter_name
  end

  post '/play_game' do
    if params[:your_name] == ''
      redirect '/'
    end
    
    @player = Player.new(params[:your_name])
    @computer = Player.new('computer')
    @computer.random_choice!
    GAME.add_player(@player)
    GAME.add_player(@computer)
    session[:game] = GAME
    session[:player] = @player
    session[:opponent] = @computer
    @buttons = CHOICES.map {|choice| button_link(choice)}
    erb :player_make_choice_picture
  end

  post '/play' do
    session[:player].choice = params[:pick].to_sym
    @my_name = session[:player].name
    @my_choice = session[:player].choice
    @opponent_name = session[:opponent].name
    @opponent_choice = session[:opponent].choice

    @winner = GAME.winner.nil? ? 'draw' : GAME.winner.name
    erb :show_result  
  end

  get '/play' do
    'why are we showing get when method is post?'
  end
  

  def button_link(choice)
    # return "<img id=#{choice} src='/images/#{choicemall.jpg\' alt='#{choice}' width='300' height='200'>"}_s
    return "<a href ='/play' method='POST' type='submit' name='pick' value='#{choice.to_sym}'><img src='images/#{choice.to_s.downcase}_small.jpg' width='100' height='75' alt='#{choice}'/></a>"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
