class AddAddressToMeetings < ActiveRecord::Migration[6.0]
  def change
    add_column :meetings, :street, :string
    add_column :meetings, :city, :string
  end
end
