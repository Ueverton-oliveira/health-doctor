class DoctorsBackoffice::DoctorsController < DoctorsBackofficeController
  def index
    @doctors = Doctor.all
  end
end
