class AddLngToUsers < ActiveRecord::Migration
  def change
    add_column :users, :longitude, :float
  end
end
