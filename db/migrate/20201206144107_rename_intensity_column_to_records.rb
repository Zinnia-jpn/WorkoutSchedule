class RenameIntensityColumnToRecords < ActiveRecord::Migration[6.0]
  def change
    rename_column :records, :intensity, :intensity_id
  end
end
