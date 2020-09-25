class HomesController < ApplicationController
  def top
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect_to "/user"
    else
      @error = "メールアドレスかパスワードが間違っています"
      render "login_form"
    end
  end

  def logout
    session[:id] = nil
    redirect_to "/"
  end
end
