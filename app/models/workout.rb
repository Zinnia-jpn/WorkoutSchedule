class Workout < ApplicationRecord
  belongs_to :category, primary_key: "id", foreign_key: "category_id"

  validates :name, presence: true
  validates :category_id, presence: true
end
