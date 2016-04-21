class CreateJamInstruments < ActiveRecord::Migration
  def change
    create_table :jam_instruments do |t|
      t.integer :jam_id
      t.integer :instrument_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
