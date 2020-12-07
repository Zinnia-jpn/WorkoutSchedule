class SchedulesController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
  end

  def dynamic_select_tables
    @select_value = params[:value] # dynamic_select_tables.js.erbに必要
    # tableの表示に必要
    @workouts = Workout.all
    @intensities = Intensity.all
    user = User.find_by(id: session[:user_id])
    current_user_records = Record.where(user_id: user.id).order(date: "ASC", workout_id: "ASC")
    if @select_value == "date"  # _date_details_table.html.erbに必要
      @today_records = current_user_records.where(date: Date.today)
      @tomorrow_records = current_user_records.where(date: Date.tomorrow)
      @yesterday_records = current_user_records.where(date: Date.yesterday)
    elsif @select_value == "month" # _month_details_table.html.erbに必要
      @this_month = Date.today.in_time_zone.all_month
      @month_records = current_user_records.where(date: @this_month)
    end
  end
end
