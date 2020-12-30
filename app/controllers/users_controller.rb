class UsersController < ApplicationController
  def show
    @user = User.find_by(id: session[:user_id])
  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = t("users.create.success")
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
    if @user.destroy
      session[:user_id] = nil
      redirect_to account_deleted_url
    else
      flash[:danger] = t("users.destroy.error")
      render "show"
    end
  end

  def revert_image
    @user.remove_image!
    if @user.save
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
