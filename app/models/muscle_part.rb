class MusclePart < ApplicationRecord
  has_many :exercise_categories, primary_key: "id", foreign_key: "muscle_parts_id"

  validates :name, presence: true
  validates :image, presence: true
end
