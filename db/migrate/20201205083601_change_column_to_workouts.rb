class ChangeColumnToWorkouts < ActiveRecord::Migration[6.0]
  def change
    change_column :workouts, :interval, :integer, limit: 2
  end
end
