class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.integer :user_id, null: false
      t.date :date, null: false
      t.boolean :whether_plan, default: true, null: false
      t.integer :exercise_id, null: false
      t.string :muscle_parts_id
      t.integer :weight, limit: 2
      t.integer :rep, limit: 1
      t.integer :set, limit: 1
      t.integer :interval, limit: 1
      t.integer :time, limit: 2
      t.integer :intensity, limit: 1
      t.string :remark

      t.timestamps
    end
  end
end
