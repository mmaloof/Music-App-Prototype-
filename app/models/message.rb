class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, :conversation_id, :user_id

  def convert_time
    self.created_at - 5.hours
  end

  def message_time
    self.convert_time.strftime("%m/%d/%y at %l:%M %p")
  end
end