module HomesHelper
  def list_items(type)
    if type == "weight"
      ["workout_id", "date", "do_flag", "weight", "rep" ,"set", "interval", "remark"]
    elsif type == "cardio"
      ["workout_id", "date", "do_flag", "time", "intensity", "remark"]
    end
  end
end
