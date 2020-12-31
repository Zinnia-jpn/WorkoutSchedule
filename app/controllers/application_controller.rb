class ApplicationController < ActionController::Base
# インクルード(読み込み)
  include SessionsHelper

# アソシエーション
  protect_from_forgery with: :null_session
  before_action :get_current_user

# アクション
  def logged_in_user
    unless logged_in?
      redirect_to root_url
    end
  end

  def get_current_user
    @user = User.find_by(id: session[:user_id])
  end

  def record_required_data_get # Recordの表示に必要なデータを取得
    @workouts = Workout.all
    @intensities = Intensity.all
  end
end
