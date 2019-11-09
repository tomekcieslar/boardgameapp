class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :name
      t.string :status
      t.text :description
      t.datetime :time
      t.integer :game_id

      t.timestamps
    end

    add_foreign_key :meetings, :games
    add_index :meetings, :game_id
  end
end
