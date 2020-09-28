class SessionsController < ApplicationController
  # CSRFトークンチェックでのエラーを回避
  skip_before_action :verify_authenticity_token

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "ログインしました"
      redirect_to "/user"
    else
      @error = "メールアドレスかパスワードが間違っています"
      render "login_form"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to "/"
  end
end
