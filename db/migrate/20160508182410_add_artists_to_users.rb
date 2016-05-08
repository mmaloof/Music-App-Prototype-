class AddArtistsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artists, :string
  end
end
