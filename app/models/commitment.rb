class Commitment < ActiveRecord::Base
  belongs_to :user
  belongs_to :jam
end
