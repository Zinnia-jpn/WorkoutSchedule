class RenameSomeColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :whether_plan, :plan_flag
    rename_column :records, :exercise_id, :workout_id
    rename_column :workouts, :muscle_parts_id, :category_id
  end
end
