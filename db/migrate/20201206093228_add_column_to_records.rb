class AddColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :cardio_flag, :boolean, default: false, null: false, after: :workout_id
  end
end
