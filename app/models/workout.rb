class Workout < ApplicationRecord

  validates :user_id, presence: true
  validates :date, presence: true
  validates :whether_plan, inclusion: { in: [true, false] }
  validates :exercise_id, presence: true
end
