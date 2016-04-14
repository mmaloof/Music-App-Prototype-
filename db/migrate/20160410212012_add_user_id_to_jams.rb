class AddUserIdToJams < ActiveRecord::Migration
  def change
    add_column :jams, :user_id, :integer
  end
end
