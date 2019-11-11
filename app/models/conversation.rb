class Conversation < ApplicationRecord
   has_many :messages
   belongs_to :meeting
end
