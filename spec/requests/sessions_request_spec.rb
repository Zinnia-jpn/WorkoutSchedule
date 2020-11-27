require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "#login_form" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get login_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#login" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        post login_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  # describe "#logout" do
  #   context "正常なHTTPリクエストを送った時" do
  #     example "リクエストが成功する" do
  #       post logout_path
  #       expect(response).to have_http_status(:success)
  #     end
  #   end
  # end
end
