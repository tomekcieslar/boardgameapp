class MeetingsUsersController < ApplicationController
  def create
    meeting = Meeting.find(params[:meeting_id])
    users = meeting.users.count
    if users == meeting.game.max_players
      flash[:error] = "You can't join to meeting, tere is no room"
      return
    end
    meeting_user = MeetingsUser.new(user_id: current_user.id, meeting_id: params[:meeting_id])
    meeting_user.save
    check_meeting_status
    redirect_to meeting_path(params[:meeting_id])
  end

  def destroy
    meeting_user = MeetingsUser.find_by(user_id: current_user.id, meeting_id: params[:meeting_id])
    meeting_user.destroy
    check_meeting_status
    redirect_to meetings_path
  end

  private

  def check_meeting_status
    meeting = Meeting.find(params[:meeting_id])
    users = meeting.users.count
    if users >= meeting.game.min_players
      meeting.update(status: 'confirmed')
    elsif users.zero?
      meeting.conversations.each do |conversation|
        conversation.messages.destroy_all
      end
      meeting.conversations.destroy_all
      meeting.destroy
    else
      meeting.update(status: 'unconfirmed')
    end
  end
end
