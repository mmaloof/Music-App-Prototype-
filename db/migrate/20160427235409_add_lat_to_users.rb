class AddLatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :latitude, :float
  end
end
