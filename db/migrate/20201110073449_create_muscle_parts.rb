class CreateMuscleParts < ActiveRecord::Migration[6.0]
  def change
    create_table :muscle_parts do |t|
      t.string :name, null: false
      t.string :image, null: false

      t.timestamps
    end
  end
end
