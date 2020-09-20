class User < ApplicationRecord

  validates :name, presence: true
  validates :mail_address, presence: true, uniqueness: true
  validates :image, presence: true
end
