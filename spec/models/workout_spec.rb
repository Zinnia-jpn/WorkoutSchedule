require 'rails_helper'

RSpec.describe Workout, type: :model do

  describe "#全般" do
    describe "#無酸素運動" do
      context "正常な値を送信した時" do
        example "保存に成功する" do
          user = build(:workout)
          expect(user).to be_valid
        end
      end
    end

    describe "#有酸素運動" do
      context "正常な値を送信した時" do
        example "保存に成功する" do
          user = build(:workout_2)
          expect(user).to be_valid
        end
      end
    end

    describe "#運動部位のみ" do
      context "正常な値を送信した時" do
        example "保存に成功する" do
          user = build(:workout_3)
          expect(user).to be_valid
        end
      end
    end
  end

  describe "#user_id" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:workout, user_id: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe "#date" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:workout, date: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe "#whether_plan" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:workout, whether_plan: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe "#exercise_id" do
    context "空の場合" do
      example "保存に失敗する" do
        user = build(:workout, exercise_id: nil)
        expect(user).not_to be_valid
      end
    end
  end
end
