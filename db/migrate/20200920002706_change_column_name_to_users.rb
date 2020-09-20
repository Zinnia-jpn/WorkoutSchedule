class ChangeColumnNameToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :mail_address, :email
  end
end
