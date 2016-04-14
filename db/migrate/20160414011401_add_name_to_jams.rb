class AddNameToJams < ActiveRecord::Migration
  def change
    add_column :jams, :name, :string
  end
end
