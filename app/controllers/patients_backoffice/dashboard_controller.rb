class PatientsBackoffice::DashboardController < PatientsBackofficeController
  def index
    @patients = Patient.all
  end
end
