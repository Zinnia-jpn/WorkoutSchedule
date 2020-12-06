class Category < ApplicationRecord
  has_many :workouts, primary_key: "id", foreign_key: "category_id"

  validates :name, presence: true
end
