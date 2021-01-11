class UsersController < ApplicationController
  before_action :logged_in_check, only: [:show, :edit, :update, :destroy, :revert_image]
  before_action :not_logged_in_check, only: [:new, :create]

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      flash[:success] = t("users.create.success")
      redirect_to schedule_date_url
    else
      render "new"
    end
  end

  def show
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    @user.errors.add(:current_password, t("users.update.mismatch")) unless @user.authenticate(params[:user][:current_password])
    if @user.errors.empty? && @user.update(user_params)
      flash[:success] = t("users.update.success")
      redirect_to user_url
    else
      render "edit"
    end
  end

  def destroy
    user = @current_user
    user.remove_image!
    log_out
    user.destroy
    session[:account_deleted] = true
    redirect_to account_deleted_url
  end

  def revert_image
    @current_user.remove_image!
    @current_user.save
    flash[:success] = t("users.revert_image.success")
    redirect_to user_url
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
