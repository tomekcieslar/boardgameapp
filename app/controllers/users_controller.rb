class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @games = @user.games.order(created_at: :desc).limit(5)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def synchronize_games
    user = User.find(params[:user_id])

    UserGamesCollection.call(user.id)
    flash[:success] = "All your games from BGG are synronized!"
    redirect_to user_path(user)
  end

  def my_meetings
    @user = User.find(params[:user_id])
    @meetings = @user.meetings
  end

  def generate_calendar_file
    user = User.find(params[:user_id])
    calendar = GenerateCalendar.call(user)
    send_data calendar.to_ical, type: 'text/calendar', disposition: 'attachment', filename: "#{user.username}+#{DateTime.now}.ics"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :avatar)
  end
end
