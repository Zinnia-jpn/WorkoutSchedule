class ExerciseCategory < ApplicationRecord
  belongs_to :muscle_part, primary_key: "muscle_parts_id", foreign_key: "id"

  validates :name, presence: true
  validates :muscle_parts_id, presence: true
end
