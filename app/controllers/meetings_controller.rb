class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  def new
    @meeting = Meeting.new
  end

  def edit
    @meeting = Meeting.find(params[:id])
  end

  def create
    @meeting = Meeting.new(meeting_params)
    @meeting.save
    assign_host

    redirect_to meeting_path(@meeting)
  end

  def update
    @meeting = Meeting.find(params[:id])
    @meeting.update(meeting_params)

    redirect_to meeting_path(@meeting)
  end

  private

  def meeting_params
    params.require(:meeting).permit(
      :name,
      :description,
      :time,
      :game_id
    ).merge(status: Meeting.statuses['not_confirmed'], host_id: current_user.id)
  end

  def assign_host
    MeetingsUser.create(user_id: current_user.id, meeting_id: @meeting.id)
  end
end
