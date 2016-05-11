class Jam < ActiveRecord::Base
  belongs_to :creator, class_name: :User, foreign_key: :user_id
  has_many :commitments
  has_many :users, through: :commitments  
  has_many :jam_instruments
  has_many :instruments, through: :jam_instruments
  has_many :jam_genres
  has_many :genres, through: :jam_genres

  def pretty_time
    time.strftime("%l : %m %p")
  end

  def datetime
    DateTime.new(date.year, date.month, date.day, time.min, time.sec)
  end
end
