class ApplicationController < ActionController::Base
  include SessionsHelper
  protect_from_forgery with: :null_session

  # ログイン済みかをチェック
  def logged_in_check
    unless logged_in?
      flash[:warning] = t("sessions.login.required")
      redirect_to login_url
    end
  end

  # ログインしていないかをチェック
  def not_logged_in_check
    if logged_in?
      flash[:warning] = t("sessions.login.already")
      redirect_to schedule_day_url
    end
  end
end
