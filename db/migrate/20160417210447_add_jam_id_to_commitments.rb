class AddJamIdToCommitments < ActiveRecord::Migration
  def change
    add_column :commitments, :jam_id, :integer
  end
end
