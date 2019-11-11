class MeetingsUsersController < ApplicationController
  def create
    meeting_user = MeetingsUser.new(user_id: current_user.id, meeting_id: params[:meeting_id])
    meeting_user.save

    redirect_to meeting_path(params[:meeting_id])
  end

  def destroy
    meeting_user = MeetingsUser.find_by(user_id: current_user.id, meeting_id: params[:meeting_id])
    meeting_user.destroy_all

    redirect_to meeetings_path
  end
end
