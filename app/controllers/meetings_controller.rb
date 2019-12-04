class MeetingsController < ApplicationController
  def index
    status = params[:status]
    start_date = params[:start_date]
    end_date = params[:end_date]
    @meetings = Meeting.all.joins(:game)
    @meetings = @meetings.where(status: params[:status]) if status.present?
    @meetings = @meetings.where('time > ?', start_date) if start_date.present?
    @meetings = @meetings.where('time < ?', end_date) if end_date.present?
    search = params[:search]
    if search.present?
      @meetings = @meetings.where(
        "meetings.name ILIKE ? OR meetings.status ILIKE ? OR games.title ILIKE ?",
        "%#{search}%", "%#{search}%", "%#{search}%"
      ).order(time: :asc)
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
    @place = Location.call(@meeting.street, @meeting.city)
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
      :game_id,
      :street,
      :city
    ).merge(host_id: current_user.id)
  end

  def status
    if @meeting.game.min_players <= @meeting.users.count
      @meeting.update(status: 'confirmed')
    else
      @meeting.update(status: 'unconfirmed')
    end
  end

  def assign_host
    MeetingsUser.create(user_id: current_user.id, meeting_id: @meeting.id)
  end
end
