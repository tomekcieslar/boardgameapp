class UserGamesCollection < ApplicationService
  def initialize(user_id)
    @user_id = user_id
    @bgg = BggApi.new
  end

  attr_accessor :user_id, :bgg

  def call
    user_games = bgg.collection(username: user.username)['item']
    user_games.each do |user_game|
      unless Game.exists?(bgg_id: user_game['objectid'])
        CreateBggGame.call(user_game['objectid'])
      end

      game = Game.find_by(bgg_id: user_game['objectid'])
      
      unless GamesUser.exists?(user_id: user.id, game_id: game.id)
        GamesUser.create(user_id: user.id, game_id: game.id)
      end
    end
  end

  private

  def user
    @user ||= User.find(user_id)
  end
end
