class SessionsController < ApplicationController
  before_action :login_check, only: [:logout]

  def login_form
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      log_in(user)
      flash[:success] = t("sessions.login.success")
      redirect_to schedule_date_url
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
