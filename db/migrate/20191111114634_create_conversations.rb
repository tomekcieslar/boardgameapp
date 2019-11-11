class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.string :title
      t.integer :meeting_id

      t.timestamps
    end

    add_foreign_key :conversations, :meetings
    add_index :conversations, :meeting_id
  end
end
