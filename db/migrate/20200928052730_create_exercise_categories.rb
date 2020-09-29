class CreateExerciseCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :exercise_categories do |t|
      t.string :name
      t.integer :muscle_parts_id
      t.boolean :whether_aerobic

      t.timestamps
    end
  end
end
