require 'rails_helper'

RSpec.describe "DoctorsBackoffice::Doctors", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/doctors_backoffice/doctors/index"
      expect(response).to have_http_status(:success)
    end
  end

end
