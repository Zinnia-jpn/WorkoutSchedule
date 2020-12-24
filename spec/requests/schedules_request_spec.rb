require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  describe "#date" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get schedule_date_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#month" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get schedule_month_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
