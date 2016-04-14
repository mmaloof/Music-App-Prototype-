class AddTimeToJams < ActiveRecord::Migration
  def change
    add_column :jams, :time, :time
    rename_column :jams, :when, :date
  end
end
