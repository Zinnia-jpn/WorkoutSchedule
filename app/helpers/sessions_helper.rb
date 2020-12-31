module SessionsHelper

  def current_user # sessionを元に現在のユーザーを取得
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in? # ログインの有無を判別 ログインチェック,header切り替えに利用
    !current_user.nil?
  end

end
