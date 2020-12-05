class MusclePart < ApplicationRecord
  has_many :exercise_categories

  validates :name, presence: true
  validates :image, presence: true
end
