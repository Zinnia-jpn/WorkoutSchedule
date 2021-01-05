class User < ApplicationRecord
  attr_accessor :remember_token
  has_secure_password
  has_many :records, primary_key: "id", foreign_key: "user_id", dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # 永続セッションに必要なトークンをハッシュ化してremember_digestカラムに記録
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # 渡されたトークンがremember_digestと一致するか
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token) # remember_tokenをハッシュ化して比較
  end

  # remember_digestカラムを削除(nilに更新)
  def forget
    update_attribute(:remember_digest, nil)
  end

  private
  # 渡された文字列をハッシュ化
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? # テスト環境か判断
               BCrypt::Engine::MIN_COST : # 最小コストを返す(4)
               BCrypt::Engine.cost # デフォルトのコストを返す(12)
    BCrypt::Password.create(string, cost: cost)
  end

  # ランダムな文字列を生成
  def User.new_token
    SecureRandom.urlsafe_base64
  end
end
