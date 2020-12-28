class ChangeImageNullToUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_null :users, :image, true
  end
end
