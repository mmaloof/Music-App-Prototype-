class CreateJamGenres < ActiveRecord::Migration
  def change
    create_table :jam_genres do |t|
      t.integer :jam_id
      t.integer :genre_id

      t.timestamps null: false
    end
  end
end
