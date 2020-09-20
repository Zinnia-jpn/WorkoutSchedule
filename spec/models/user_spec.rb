require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

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
        user = build(:user, mail_address: nil)
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
