class Jam < ActiveRecord::Base
  belongs_to :creator, class_name: :User, foreign_key: :user_id
  has_many :commitments
  has_many :users, through: :commitments
end
