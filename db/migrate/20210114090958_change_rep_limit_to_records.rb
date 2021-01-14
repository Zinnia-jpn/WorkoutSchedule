class ChangeRepLimitToRecords < ActiveRecord::Migration[6.0]
  def change
    change_column :records, :rep, :integer, limit: 2
  end
end
