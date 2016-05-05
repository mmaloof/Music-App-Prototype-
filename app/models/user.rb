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

  geocoded_by :address
  after_validation :geocode 

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def name
    "#{first_name} #{last_name}" 
  end 
end
