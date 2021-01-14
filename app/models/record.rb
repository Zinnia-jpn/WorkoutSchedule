class Record < ApplicationRecord
# アソシエーション
  belongs_to :user, primary_key: "id", foreign_key: "user_id"

# 検証機能
  validates :user_id, presence: true
  validates :date, presence: true
  validates :do_flag, inclusion: { in: [true, false] }
  validates :workout_id, presence: true
  validates :cardio_flag, inclusion: { in: [true, false] }
  validates :weight, length: { maximum: 500 }
  validates :rep, length: { maximum: 500 }
  validates :set, length: { maximum: 50 }
  validates :interval, length: { maximum: 600 }
  validates :time, length: { maximum: 600 }
  validates :remark, length: { maximum: 255 }

# Model内で使用するメソッド
  def get_current_user_records(user_id) # 現在のユーザーのRecordだけを全て取得
    return Record.where(user_id: user_id).order(date: "ASC", workout_id: "ASC")
  end

# Controllerで使用するメソッド
  def get_specified_records(user_id, date_range) # 指定された範囲のRecordを取得
    return get_current_user_records(user_id).where(date: date_range)
  end
end
