class ConversationSerializer < ActiveModel::Serializer
  attributes :id, :title, :meeting_id
  has_many :messages
end
