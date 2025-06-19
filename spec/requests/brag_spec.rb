require 'rails_helper'

RSpec.describe "Brags", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/brag/index"
      expect(response).to have_http_status(:success)
    end

    it "renders the brag page content" do
      get "/brag/index"
      expect(response.body).to include("My little 2025 Goals")
    end
  end
end
