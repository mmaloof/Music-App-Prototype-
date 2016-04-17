class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.string :jam_id
      t.string :integer
      t.string :user_id
      t.string :integer

      t.timestamps null: false
    end
  end
end
