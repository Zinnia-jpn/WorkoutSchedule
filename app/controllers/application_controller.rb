class ApplicationController < ActionController::Base
# アソシエーション
  protect_from_forgery with: :null_session
  before_action :get_current_user

# アクション
  def get_current_user
    @user = User.find_by(id: session[:user_id])
  end

  def record_required_data_get # Recordの表示に必要なデータを取得
    @workouts = Workout.all
    @intensities = Intensity.all
  end
end
