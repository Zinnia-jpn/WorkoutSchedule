class UsersController < ApplicationController
  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], image: "default_user_image.jpeg")
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to schedule_url
    else
      render "new"
    end
  end

  def edit
    @user = User.find_by(id: session[:user_id])
  end

  def update
    @user = User.find_by(id: session[:user_id])
    if @user.authenticate(params[:current_password])
      if params[:password] == params[:password_confirmation]
        if @user.update(name: params[:name], email: params[:email], password: params[:password])
          redirect_to user_url
        else
          render "edit"
        end
      else
        @error = "新しいパスワードと再入力が一致していません"
        render "edit"
      end
    else
      @error = "現在のパスワードが間違っています"
      render "edit"
    end
  end
end
