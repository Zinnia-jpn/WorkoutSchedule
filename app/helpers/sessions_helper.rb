module SessionsHelper
  def log_in(user) # ログイン処理
    session[:user_id] = user.id
  end

  def log_out # ログアウト処理
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user # sessionを元に現在のユーザーを取得
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def logged_in? # ログインの有無を判別 ログインチェック,header切り替えに利用
    !current_user.nil?
  end

  def current_user?(user) # 引数と現在のユーザーが一致しているか判断する
    user == current_user
  end
end
