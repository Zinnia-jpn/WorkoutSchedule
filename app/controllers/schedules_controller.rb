class SchedulesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @workouts = Workout.all
    @records = Record.where(user_id: @user.id)
    @today_records = @records.where(date: Date.today)
    @intensities = Intensity.all
  end
end
