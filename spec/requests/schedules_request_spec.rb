require 'rails_helper'

RSpec.describe "Schedules", type: :request do
  describe "#index" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get schedule_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
