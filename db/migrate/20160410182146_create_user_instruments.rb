class CreateUserInstruments < ActiveRecord::Migration
  def change
    create_table :user_instruments do |t|
      t.integer :user_id
      t.integer :instrument_id

      t.timestamps null: false
    end
  end
end
