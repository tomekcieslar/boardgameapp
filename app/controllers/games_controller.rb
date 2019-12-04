class GamesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    search = params[:search]
    if search.present?
      @games = @user.games.where('title ILIKE ?', "%#{search}%").order(:title)
    else
      @games = @user.games
    end
  end

  def show
    @game = Game.find(params[:id])
  end
end
