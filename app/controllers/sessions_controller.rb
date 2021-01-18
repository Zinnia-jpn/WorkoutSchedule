class SessionsController < ApplicationController
  before_action :logged_in_check, only: [:logout]
  before_action :not_logged_in_check, only: [:login_form, :login]

  def login_form
    @user = User.new()
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      params[:remember] == "1" ? remember(@user) : forget(@user)
      flash[:success] = t("sessions.login.success")
      redirect_to schedule_day_url
    else
      @login_error =  t("sessions.login.failure")
      render "login_form"
    end
  end

  def logout
    log_out
    flash[:success] = t("sessions.logout.success")
    redirect_to root_url
  end
end
