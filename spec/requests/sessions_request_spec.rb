require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /login_form" do
    it "returns http success" do
      get "/sessions/login_form"
      expect(response).to have_http_status(:success)
    end
  end

end
