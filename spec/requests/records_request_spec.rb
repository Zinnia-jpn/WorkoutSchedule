require 'rails_helper'

RSpec.describe "Records", type: :request do
  describe "#new" do
    context "正常なHTTPリクエストを送った時" do
      context "適切なパラメータ(flag: true)を渡した時" do
        example "リクエストが成功する" do
          get record_new_path, params: {flag: "true"}
          expect(response).to have_http_status(:success)
        end
      end
      context "適切なパラメータ(flag: false)を渡した時" do
        example "リクエストが成功する" do
          get record_new_path, params: {flag: "false"}
          expect(response).to have_http_status(:success)
        end
      end
    end
  end
end
