require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let(:user_2) { create(:user_2) }

  describe "#全般" do
    context "正常な値を送信した場合" do
      example "有効" do
        expect(user).to be_valid
      end
    end
  end

  describe "#name" do
    context "空の場合" do
      example "無効" do
        user.name = nil
        user.valid?
        expect(user.errors.messages[:name]).to include( I18n.t("errors.messages.blank") )
      end
    end

    context "最大文字数(30)の場合" do
      example "有効" do
        user.name = "x" * 30
        expect(user).to be_valid
      end
    end

    context "最大文字数(30)を超えた場合" do
      example "無効" do
        user.name = "x" * 31
        user.valid?
        expect(user.errors.messages[:name]).to include( I18n.t("errors.messages.too_long", count: 30) )
      end
    end
  end

  describe "#email" do
    context "空の場合" do
      example "無効" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors.messages[:email]).to include( I18n.t("errors.messages.blank") )
      end
    end

    context "登録済みの他ユーザーと同一のアドレスが入力された場合" do
      example "無効" do
        user.email = user_2.email
        user.valid?
        expect(user.errors.messages[:email]).to include( I18n.t("errors.messages.taken") )
      end
    end

    context "メールアドレスの形式が異なっていた場合" do
      example "無効" do
        user.email = "sample_email.com"
        user.valid?
        expect(user.errors.messages[:email]).to include( I18n.t("errors.messages.wrong_format_to_email") )
      end
    end
  end

  describe "#password" do
    context "空の場合" do
      example "無効" do
        user.password = nil
        user.valid?
        expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.blank") )
      end
    end

    context "形式が異なる場合" do
      context "英大文字が入っていない場合" do
        example "無効" do
          user.password = "password1-sample"
          user.valid?
          expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.wrong_format_to_password") )
        end
      end

      context "英小文字が入っていない場合" do
        example "無効" do
          user.password = "PASSWORD1-SAMPLE"
          user.valid?
          expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.wrong_format_to_password") )
        end
      end

      context "数字が入っていない場合" do
        example "無効" do
          user.password = "PASSword-sample"
          user.valid?
          expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.wrong_format_to_password") )
        end
      end

      context "最小文字数(8)の場合" do
        example "有効" do
          user.password = "PASSsam1"
          expect(user).to be_valid
        end
      end

      context "最小文字数(8)未満の場合" do
        example "無効" do
          user.password = "PASwor1"
          user.valid?
          expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.wrong_format_to_password") )
        end
      end

      context "最大文字数(30)の場合" do
        example "有効" do
          user.password = "P" * 10 + "p" * 10 + "1" * 10
          expect(user).to be_valid
        end
      end

      context "最大文字数(30)を超えた場合" do
        example "無効" do
          user.password = "P" * 10 + "p" * 10 + "1" * 11
          user.valid?
          expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.wrong_format_to_password") )
        end
      end

      context "半角英大文字・小文字・数字以外の値が混ざっていた場合" do
        example "無効" do
          user.password = "P" * 5 + "p" * 5 + "1" * 5 + "あ" * 5
          user.valid?
          expect(user.errors.messages[:password]).to include( I18n.t("errors.messages.wrong_format_to_password") )
        end
      end
    end
  end

  describe "#image" do
    context "空の場合" do
      example "有効" do
        user.image = nil
        expect(user).to be_valid
      end
    end
  end
end
