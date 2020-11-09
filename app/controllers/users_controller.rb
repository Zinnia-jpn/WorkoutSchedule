class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], image: "default_user_image.jpeg")
    if @user.save
      flash[:success] = "ユーザー登録が完了しました"
      redirect_to "/schedule"
    else
      render "new"
    end
  end
end
