class JamInstrument < ActiveRecord::Base
  belongs_to :instrument
  belongs_to :jam 
end
