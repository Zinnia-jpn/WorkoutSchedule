module SessionsHelper
  # ログイン処理
  def log_in(user)
    session[:user_id] = user.id
  end

  # ログインの有無を判別
  def logged_in?
    !current_user.nil?
  end

  # session,cookieを元に@current_userを取得
  def current_user
    if (user_id = session[:user_id].present?) # user_idに代入した上で、user_idが存在しているか
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id]) # 永続セッションが存在する場合「ログイン処理,@current_userへの代入」を行う
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in(user)
        @current_user = user
      end
    end
  end

  # 引数と現在のユーザーが一致しているか判断
  def current_user?(user)
    user == current_user
  end

  # DBとcookieに永続セッション関連データを保存
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id # user.idを署名つきcookieにして保存
    cookies.permanent[:remember_token] = user.remember_token # DBのremenber_digestと参照するためのトークンを保存
  end

  # ログアウト処理
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # 永続セッション関連データの削除(DB・cookie)
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
end
