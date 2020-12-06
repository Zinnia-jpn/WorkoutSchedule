class RenameSomeTables < ActiveRecord::Migration[6.0]
  def change
    rename_table :workouts, :Records
    rename_table :exercise_categories, :workouts
    rename_table :muscle_parts, :categories
  end
end
