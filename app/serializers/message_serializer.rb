class MessageSerializer < ActiveModel::Serializer
   attributes :id, :conversation_id, :text, :created_at, :user, :time

   def user
     user = User.find(object.user_id)
     user.username
   end

   def time
     day = DateTime.now.day - self.object.created_at.to_datetime.day
     if day == 0
       day = ''
     elsif day == 1
       day = ' Tomorrow '
     else
       day = "#{day} days ago at "
     end
     "#{day}#{self.object.created_at.strftime("%H:%M")}"
   end
end
