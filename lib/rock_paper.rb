require 'sinatra/base'

class RockPaper < Sinatra::Base
  get '/' do
    'Please enter your name'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
