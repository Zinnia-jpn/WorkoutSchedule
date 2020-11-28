class ExerciseCategory < ApplicationRecord

  validates :name, presence: true
  validates :muscle_parts_id, presence: true
end
