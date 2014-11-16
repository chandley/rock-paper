require 'sinatra/base'

class RockPaper < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views") }

  get '/' do
    'Please enter your name'
    erb :enter_name
  end

  post '/play_game' do
    if params[:your_name] == ''
      redirect '/'
    end
    @name = params[:your_name]
    erb :player_make_choice

  end

  post '/play' do
    @pick = params[:pick]
    @computer_pick = random_choice
    @result = game_outcome(@pick, @computer_pick)
    erb :result  
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
