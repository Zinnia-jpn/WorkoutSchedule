class HomesController < ApplicationController
  def top
    @weight_items = ["workout_id", "date", "do_flag", "weight", "rep" ,"set", "interval", "remark"]
    @cardio_items = ["workout_id", "date", "do_flag", "time", "intensity", "remark"]
  end

  def account_deleted_notification
  end
end