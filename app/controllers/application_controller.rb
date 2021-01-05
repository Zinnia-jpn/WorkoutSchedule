class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :null_session

  def login_check
    redirect_to root_url unless logged_in?
  end

  def record_required_data_get # Recordの表示に必要なデータを取得
    @workouts = Workout.all
    @intensities = Intensity.all
  end
end
