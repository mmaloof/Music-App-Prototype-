class DeleteIntegerFromCommitments < ActiveRecord::Migration
  def change
    remove_column :commitments, :integer, :string
  end
end
