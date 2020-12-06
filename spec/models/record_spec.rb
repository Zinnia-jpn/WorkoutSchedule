require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    create(:user)
  end

  describe "#全般" do
    describe "#無酸素運動" do
      context "正常な値を送信した時" do
        example "保存に成功する" do
          record = build(:record)
          expect(record).to be_valid
        end
      end
    end

    describe "#有酸素運動" do
      context "正常な値を送信した時" do
        example "保存に成功する" do
          record = build(:record_2)
          expect(record).to be_valid
        end
      end
    end
  end

  describe "#user_id" do
    context "空の場合" do
      example "保存に失敗する" do
        record = build(:record, user_id: nil)
        expect(record).not_to be_valid
      end
    end
  end

  describe "#date" do
    context "空の場合" do
      example "保存に失敗する" do
        record = build(:record, date: nil)
        expect(record).not_to be_valid
      end
    end
  end

  describe "#plan_flag" do
    context "空の場合" do
      example "保存に失敗する" do
        record = build(:record, plan_flag: nil)
        expect(record).not_to be_valid
      end
    end
  end

  describe "#workout_id" do
    context "空の場合" do
      example "保存に失敗する" do
        record = build(:record, workout_id: nil)
        expect(record).not_to be_valid
      end
    end
  end
end
