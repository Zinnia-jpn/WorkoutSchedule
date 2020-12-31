class UsersController < ApplicationController
  before_action :login_check, only: [:show, :edit, :update, :destroy, :revert_image]

  def show
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      log_in(@user)
      flash[:success] = t("users.create.success")
      redirect_to schedule_date_url
    else
      render "new"
    end
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user
    if @user.authenticate(params[:current_password])
      if params[:password] == params[:password_confirmation]
        if @user.update(name: params[:name], email: params[:email], password: params[:password], image: params[:image])
          flash[:success] = t("users.update.success")
          redirect_to user_url
        else
          render "edit"
        end
      else
        @user.errors.add(:base, t("users.update.mismatch_new_pw"))
        render "edit"
      end
    else
      @user.errors.add(:base, t("users.update.mismatch_current_pw"))
      render "edit"
    end
  end

  def destroy
    if @current_user.destroy
      log_out
      redirect_to account_deleted_url
    else
      flash[:danger] = t("users.destroy.error")
      render "show"
    end
  end

  def revert_image
    @current_user.remove_image!
    if @current_user.save
      flash[:success] = t("users.revert_image.success")
      redirect_to user_url
    else
      flash[:danger] = t("users.revert_image.error")
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :image)
  end
end
