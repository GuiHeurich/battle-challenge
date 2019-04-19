require 'sinatra/base'
require_relative 'player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/names' do
    $p1 = Player.new(params[:p1_name])
    $p2 = Player.new(params[:p2_name])
    redirect '/play'
  end

  get '/play' do
    @p1_name = $p1.name
    @p2_name = $p2.name
    @p1_hp = 100
    @p2_hp = 100
    erb :play
  end

  post '/attack' do
    redirect '/result'
  end

  get '/result' do
    @p1_name = $p1.name
    @p2_name = $p2.name
    @p1_hp = 100
    @p2_hp = 80
    erb :result
  end

  run! if app_file == $0
end
