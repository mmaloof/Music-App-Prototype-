class AddUserIdToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :user_id, :integer
  end
end
