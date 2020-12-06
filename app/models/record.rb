class Record < ApplicationRecord
  belongs_to :user, primary_key: "id", foreign_key: "user_id"

  validates :user_id, presence: true
  validates :date, presence: true
  validates :plan_flag, inclusion: { in: [true, false] }
  validates :workout_id, presence: true
  validates :cardio_flag, inclusion: { in: [true, false] }
end
