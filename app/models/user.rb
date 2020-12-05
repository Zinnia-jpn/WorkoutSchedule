class User < ApplicationRecord
  has_secure_password
  has_many :workouts, primary_key: "id", foreign_key: "user_id", dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :image, presence: true
  validates :password_digest, presence: true
end
