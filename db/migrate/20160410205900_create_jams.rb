class CreateJams < ActiveRecord::Migration
  def change
    create_table :jams do |t|
      t.string :venue
      t.datetime :when
      t.string :summary
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps null: false
    end
  end
end
