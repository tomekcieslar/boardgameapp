class CreateUserMeetings < ActiveRecord::Migration[6.0]
  def change
    create_join_table :meetings, :users do |t|
      t.index :meeting_id
      t.index :user_id

      t.timestamps
    end
  end
end
