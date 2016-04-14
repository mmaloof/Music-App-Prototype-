class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :genres, through: :user_genres
  has_many :instruments, through: :user_instruments
  has_many :user_genres
  has_many :user_instruments
end
