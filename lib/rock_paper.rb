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
    erb :player_make_choice
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
