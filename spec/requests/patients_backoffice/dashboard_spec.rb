require 'rails_helper'

RSpec.describe "PatientsBackoffice::Dashboards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/patients_backoffice/dashboard/index"
      expect(response).to have_http_status(:success)
    end
  end

end
