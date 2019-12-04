class AddIdToToGamesUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :games_users, :id, :primary_key
    add_column :games_users, :created_at, :datetime
    add_column :games_users, :updated_at, :datetime
  end
end
