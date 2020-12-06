class RemoveSomeColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :muscle_parts_id
    remove_column :categories, :image
  end
end
