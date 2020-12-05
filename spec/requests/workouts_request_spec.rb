require 'rails_helper'

RSpec.describe "Workouts", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/workouts/new"
      expect(response).to have_http_status(:success)
    end
  end

end
