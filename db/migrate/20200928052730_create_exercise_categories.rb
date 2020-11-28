class CreateExerciseCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_categories do |t|
      t.string :name, null: false
      t.integer :muscle_parts_id, null: false

      t.timestamps
    end
  end
end
