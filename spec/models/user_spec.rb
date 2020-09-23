require 'rails_helper'

RSpec.describe User, type: :model do

  describe "#全般" do
    context "正常な値を送信した時" do
      example "保存に成功する" do
        user = build(:user)
        expect(user).to be_valid
      end
    end
  end

  describe "#name" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:user, name: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe "#mail_address" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:user, email: nil)
        expect(user).not_to be_valid
      end
    end

    context "同じメールアドレスが入力された場合" do
      example "保存に失敗する" do
        create(:user)
        user = build(:user_2, email: "mail-sample@rails.com")
        expect(user).not_to be_valid
      end
    end
  end

  describe "#password" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:user, password: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe "#image" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:user, image: nil)
        expect(user).not_to be_valid
      end
    end
  end
end
