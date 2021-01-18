require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  let(:user) { build(:user) }
  let!(:record) { create(:record, token: "7EcAdn8kIqZkgYC8gyBHmw", date: Date.today) }

  xdescribe "GET #day" do
    it_behaves_like "ログイン状態の時" do
      example "リクエストが成功する" do
        get schedule_day_path
        expect(response).to have_http_status(:success)
      end
      example "当日のデータを取得する" do
        get schedule_day_path
        expect(assigns(:select_date)).to eq(Date.today)
        expect(assigns(:date_records)).to include(record)
      end
    end
  end

  xdescribe "GET #month" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get schedule_month_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
