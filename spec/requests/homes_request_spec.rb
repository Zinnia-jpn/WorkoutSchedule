require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "#top" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get :"/"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
