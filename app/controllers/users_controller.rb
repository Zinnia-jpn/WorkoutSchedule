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
      flash[:success] = @error = t("users.create.success")
      redirect_to schedule_date_url
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
        @error = t("users.update.mismatch_new_pw")
        render "edit"
      end
    else
      @error = t("users.update.mismatch_current_pw")
      render "edit"
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      redirect_to account_deleted_url
    else
      flash[:danger] = "エラーが発生しました"
      render "show"
    end
  end
end
