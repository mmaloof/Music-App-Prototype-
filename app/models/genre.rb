class Genre < ActiveRecord::Base
  has_many :user_genres
  has_many :users, through: :user_genres
  has_many :jam_genres
  has_many :jams, through: :jam_genres
end
