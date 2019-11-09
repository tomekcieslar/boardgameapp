class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.integer :max_players
      t.integer :min_players
      t.integer :max_time
      t.integer :min_time
      t.text :description
      t.integer :bgg_id
      t.decimal :rating

      t.timestamps
    end
  end
end
