class DeleteUserIdFromCommitments < ActiveRecord::Migration
  def change
    remove_column :commitments, :user_id, :string
  end
end
