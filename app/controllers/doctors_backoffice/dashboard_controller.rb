class DoctorsBackoffice::DashboardController < DoctorsBackofficeController
  def index
    @doctors = Doctor.all
  end
end
