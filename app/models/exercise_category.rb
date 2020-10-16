class ExerciseCategory < ApplicationRecord

  validates :name, presence: true
  validates :muscle_parts_id, presence: true
  validates :whether_aerobic, inclusion: { in: [true, false] }
end
