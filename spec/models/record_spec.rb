require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    create(:user) # 生成するRecordと紐づけられるUserを作成
  end
  let(:record) { build(:record) }
  let(:record_2) { build(:record_2) }

  describe "#全般" do
    describe "#無酸素運動" do
      context "正常な値を送信した場合" do
        example "有効" do
          expect(record).to be_valid
        end
      end
    end

    describe "#有酸素運動" do
      context "正常な値を送信した場合" do
        example "有効" do
          expect(record_2).to be_valid
        end
      end
    end
  end

  describe "#user_id" do
    context "空の場合" do
      example "無効" do
        record.user_id = nil
        record.valid?
        expect(record.errors.messages[:user_id]).to include( I18n.t("errors.messages.blank") )
      end
    end

    context "存在しないユーザーだった場合" do
      example "無効" do
        record.user_id = 100
        record.valid?
        expect(record).not_to be_valid
      end
    end
  end

  describe "#date" do
    context "空の場合" do
      example "無効" do
        record.date = nil
        record.valid?
        expect(record.errors.messages[:date]).to include( I18n.t("errors.messages.blank") )
      end
    end
  end

  describe "#do_flag" do
    context "空の場合" do
      example "無効" do
        record.do_flag = nil
        record.valid?
        expect(record.errors.messages[:do_flag]).to include( I18n.t("errors.messages.inclusion") )
      end
    end
  end

  describe "#workout_id" do
    context "空の場合" do
      example "無効" do
        record.workout_id = nil
        record.valid?
        expect(record.errors.messages[:workout_id]).to include( I18n.t("errors.messages.blank") )
      end
    end
  end

  describe "#cardio_flag" do
    context "空の場合" do
      example "無効" do
        record.cardio_flag = nil
        record.valid?
        expect(record.errors.messages[:cardio_flag]).to include( I18n.t("errors.messages.inclusion") )
      end
    end
  end

  describe "#weight" do
    context "最大値(500)の場合" do
      example "有効" do
        record.weight = 500
        expect(record).to be_valid
      end
    end

    context "最大値(500)を超えた場合" do
      example "無効" do
        record.weight = 501
        record.valid?
        expect(record.errors.messages[:weight]).to include( I18n.t("errors.messages.less_than_or_equal_to", count: 500) )
      end
    end
  end

  describe "#rep" do
    context "最大値(500)の場合" do
      example "有効" do
        record.rep = 500
        expect(record).to be_valid
      end
    end

    context "最大値(500)を超えた場合" do
      example "無効" do
        record.rep = 501
        record.valid?
        expect(record.errors.messages[:rep]).to include( I18n.t("errors.messages.less_than_or_equal_to", count: 500) )
      end
    end
  end

  describe "#set" do
    context "最大値(50)の場合" do
      example "有効" do
        record.set = 50
        expect(record).to be_valid
      end
    end

    context "最大値(50)を超えた場合" do
      example "無効" do
        record.set = 51
        record.valid?
        expect(record.errors.messages[:set]).to include( I18n.t("errors.messages.less_than_or_equal_to", count: 50) )
      end
    end
  end

  describe "#interval" do
    context "最大値(600)の場合" do
      example "有効" do
        record.interval = 600
        expect(record).to be_valid
      end
    end

    context "最大値(600)を超えた場合" do
      example "無効" do
        record.interval = 601
        record.valid?
        expect(record.errors.messages[:interval]).to include( I18n.t("errors.messages.less_than_or_equal_to", count: 600) )
      end
    end
  end

  describe "#time" do
    context "最大値(600)の場合" do
      example "有効" do
        record.time = 600
        expect(record).to be_valid
      end
    end

    context "最大値(600)を超えた場合" do
      example "無効" do
        record.time = 601
        record.valid?
        expect(record.errors.messages[:time]).to include( I18n.t("errors.messages.less_than_or_equal_to", count: 600) )
      end
    end
  end

  describe "#remark" do
    context "最大文字数(255)の場合" do
      example "有効" do
        record.remark = "a" * 255
        expect(record).to be_valid
      end
    end

    context "最大文字数(255)を超えた場合" do
      example "無効" do
        record.remark = "a" * 256
        record.valid?
        expect(record.errors.messages[:remark]).to include( I18n.t("errors.messages.too_long", count: 255) )
      end
    end
  end
end
