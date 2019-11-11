class GamessController < ApplicationController
  def index
    user = User.find(paramss[:user_id])
    @games = user.games
  end

  def show
    @game = Game.find(params[:id])
  end
end
