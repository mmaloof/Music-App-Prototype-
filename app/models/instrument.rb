class Instrument < ActiveRecord::Base
  has_many :user_instruments
  has_many :users, through: :user_instruments
  has_many :jams, through: :jam_instruments
end
