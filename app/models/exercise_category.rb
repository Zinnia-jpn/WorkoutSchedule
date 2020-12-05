class ExerciseCategory < ApplicationRecord
  belongs_to :muscle_part, foreign_key: "muscle_parts_id"

  validates :name, presence: true
  validates :muscle_parts_id, presence: true
end
