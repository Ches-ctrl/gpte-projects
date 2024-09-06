class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    user_message = Message.create(content: message_params[:content], is_user_message: true)
    ai_response = OpenAIChatService.get_response(user_message.content)
    Message.create(content: ai_response, is_user_message: false)

    redirect_to messages_path
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end