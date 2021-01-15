class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :null_session

  # ログイン済みかをチェック
  def logged_in_check
    redirect_to root_url unless logged_in?
  end

  # ログインしていないかをチェック
  def not_logged_in_check
    redirect_to schedule_day_url if logged_in?
  end
end
