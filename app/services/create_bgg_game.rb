class CreateBggGame < ApplicationService
  require 'open-uri'

  def initialize(game_id)
    @game_id = game_id
    @bgg = BggApi.new
  end

  attr_accessor :game_id, :bgg

  def call
    bgg_game = bgg.thing(id: game_id)['item'].first

    game = Game.new(
      title: bgg_game['name'].first['value'],
      max_players: bgg_game['maxplayers'].first['value'],
      min_players: bgg_game['minplayers'].first['value'],
      max_time: bgg_game['minplaytime'].first['value'],
      min_time: bgg_game['minplaytime'].first['value'],
      description: bgg_game['description'].first,
      bgg_id: bgg_game['id']
      # rating: 9,
    )
    game.save
    game.image.attach(io: open(bgg_game['image'].first), filename: "#{game.title}.jpg")
    game.thumbnail.attach(io: open(bgg_game['thumbnail'].first), filename: "#{game.title}_thumbnail.jpg")
  end
end
