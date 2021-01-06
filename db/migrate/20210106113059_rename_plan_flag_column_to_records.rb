class RenamePlanFlagColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :plan_flag, :do_flag
  end
end
