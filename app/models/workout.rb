class Workout < ApplicationRecord
  # アソシエーション
  belongs_to :category, primary_key: "id", foreign_key: "category_id"

  # 検証機能
  validates :name, presence: true
  validates :category_id, presence: true
end
