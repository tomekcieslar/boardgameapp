class AddIdToMeetingsUser < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings_users, :id, :primary_key
  end
end
