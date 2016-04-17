class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :genres, through: :user_genres
  has_many :instruments, through: :user_instruments
  has_many :user_genres
  has_many :user_instruments
  has_many :created_jams, class_name: :Jam, foreign_key: :user_id
  has_many :commitments
  has_many :jams, through: :commitments

  def name
    "#{first_name} #{last_name}" 
  end 
end
