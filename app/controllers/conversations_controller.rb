class ConversationsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    conversations = Conversation.where(meeting_id: params['meeting_id'])
    render json: conversations
  end

  def create
    meeting = Meeting.find(params['meeting_id'])
    conversation = meeting.build_conversation(conversation_params)
    if conversation.save
      serialized_data = ActiveModelSerializers::Adapter::Json.new(
        ConversationSerializer.new(conversation)
      ).serializable_hash
      ActionCable.server.broadcast 'conversations_channel', serialized_data
      head :ok
    end
  end

  private

  def conversation_params
    params.require(:conversation).permit(:title, :meeting_id)
  end
end
