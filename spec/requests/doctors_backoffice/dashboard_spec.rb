require 'rails_helper'

RSpec.describe "DoctorsBackoffice::Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/doctors_backoffice/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
