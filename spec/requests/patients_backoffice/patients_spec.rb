require 'rails_helper'

RSpec.describe "PatientsBackoffice::Patients", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/patients_backoffice/patients/index"
      expect(response).to have_http_status(:success)
    end
  end

end
