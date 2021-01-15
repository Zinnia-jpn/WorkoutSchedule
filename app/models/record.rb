class Record < ApplicationRecord
  belongs_to :user, primary_key: "id", foreign_key: "user_id"
  after_save :create_token

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

  # 指定された範囲のRecordを取得
  def get_specified_records(user_id, date_range)
    return get_user_records(user_id).where(date: date_range)
  end

  private
  # urlへ埋め込むtokenの生成・保存
  def create_token
    if token.nil?
      random_token = SecureRandom.urlsafe_base64 # ランダムな文字列を生成
      update_column(:token, random_token)
    end
  end

  # 現在のユーザーのRecordを全て取得
  def get_user_records(user_id)
    return Record.where(user_id: user_id).order(date: "ASC", workout_id: "ASC")
  end
end
