class MessagesController < ApplicationController
  before_action do 
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    if current_user.id == @conversation.sender_id
      @user = User.find(@conversation.recipient_id)
    else
      @user = User.find(@conversation.sender_id)
    end
    
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end

    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end

    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    @message = @conversation.messages.new

    @banner_image = "/assets/images/guitar.jpg"
    @banner_title = "Messages"
    @banner_subtitle = ""
  end

  def new 
    @message = @conversation.messages.new
  end

  def create
    @message = @conversation.messages.new(message_params)
    if @message.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    if current_user.id == @message.user_id
      @message.destroy
      redirect_to conversation_messages_path(@conversation)
    else
      redirect_to '/conversations'
    end
  end

  private
  
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
