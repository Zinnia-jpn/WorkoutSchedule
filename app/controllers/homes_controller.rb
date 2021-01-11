class HomesController < ApplicationController
  before_action :not_logged_in_check, only: [:top]

  def top
    @weight_items = ["workout_id", "date", "do_flag", "weight", "rep" ,"set", "interval", "remark"]
    @cardio_items = ["workout_id", "date", "do_flag", "time", "intensity", "remark"]
  end

  def account_deleted_notification
    session[:account_deleted] ? session[:account_deleted] = nil : redirect_to(root_path)
  end
end
