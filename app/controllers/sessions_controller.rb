class SessionsController < ApplicationController

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = t("sessions.login.success")
      redirect_to schedule_date_url
    else
      flash[:danger] = t("sessions.login.failure")
      render "login_form"
    end
  end

  def logout
    session[:user_id] = nil
    flash[:success] = t("sessions.logout.success")
    redirect_to root_url
  end
end
