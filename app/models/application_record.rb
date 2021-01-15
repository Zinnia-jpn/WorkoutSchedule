class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected
  # 参照に必要なデータのみ抽出
  def self.reference_data
    self.select("id", "name")
  end
end
