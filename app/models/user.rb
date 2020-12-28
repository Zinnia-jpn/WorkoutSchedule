class User < ApplicationRecord
  has_secure_password
  has_many :records, primary_key: "id", foreign_key: "user_id", dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
