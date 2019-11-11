class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :text
      t.references :conversation, null: false, foreign_key: true
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :messages, :users
    add_index :messages, :user_id
  end
end
