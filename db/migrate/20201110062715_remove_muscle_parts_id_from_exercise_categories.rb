class RemoveMusclePartsIdFromExerciseCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :exercise_categories, :muscle_parts_id, :integer
  end
end
