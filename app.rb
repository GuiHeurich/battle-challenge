require 'sinatra/base'
require_relative 'player'
require_relative 'game'
require_relative 'attack'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.get
  end

  get '/' do
    erb :index
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.set(player_1, player_2)
    redirect '/play'
  end

  get '/play' do
    erb :play
  end

  post '/attack' do
    redirect '/attack'
  end

  get '/attack' do
    Attack.run(@game.opponent_of(@game.current_turn))
    erb :attack
  end

  post '/switch_turns' do
    @game.switch_turns
    redirect '/play'
  end

  run! if app_file == $0
end
