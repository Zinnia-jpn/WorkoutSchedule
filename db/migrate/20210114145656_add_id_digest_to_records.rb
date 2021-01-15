class AddIdDigestToRecords < ActiveRecord::Migration[6.0]
  def change
    add_column :records, :token, :string, after: :id
    add_index :records, :token
  end
end
