class Workout < ApplicationRecord
  belongs_to :user, primary_key: "user_id", foreign_key: "id"

  validates :user_id, presence: true
  validates :date, presence: true
  validates :whether_plan, inclusion: { in: [true, false] }
  validates :exercise_id, presence: true
end
