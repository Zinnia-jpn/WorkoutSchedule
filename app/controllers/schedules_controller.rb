class SchedulesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @workouts = Workout.all
    @intensities = Intensity.all
    current_user_records = Record.where(user_id: @user.id)
    @today_records = current_user_records.where(date: Date.today)
    @tomorrow_records = current_user_records.where(date: Date.tomorrow)
  end

end
