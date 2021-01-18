require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET #top" do
    context "非ログイン状態の時" do
      example "リクエストが成功する" do
        get root_path
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "GET #account_deleted_notification" do
    context "users#deleteからリダイレクトされた時" do
      #users_request_specにてテストしているので不要
    end

    context "users#delete以外からTリクエストを送った時" do
      example "root_urlにリダイレクトする" do
        get account_deleted_path
        expect(response).to redirect_to(root_url)
      end
    end
  end
end
