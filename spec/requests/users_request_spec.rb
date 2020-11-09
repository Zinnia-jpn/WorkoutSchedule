require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#show" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get user_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#new" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        get signup_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "#create" do
    context "正常なHTTPリクエストを送った時" do
      example "リクエストが成功する" do
        post user_create_path
        expect(response).to have_http_status(:success)
      end
    end
  end
end
