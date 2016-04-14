class EditDateInJams < ActiveRecord::Migration
  def change
    change_column :jams, :date, :date
  end
end
