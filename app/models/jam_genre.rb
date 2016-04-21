class JamGenre < ActiveRecord::Base
  belongs_to :genre 
  belongs_to :jam 
end
