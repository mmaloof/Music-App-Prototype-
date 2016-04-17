class DeleteJamIdFromCommitments < ActiveRecord::Migration
  def change
    remove_column :commitments, :jam_id, :string
  end
end
