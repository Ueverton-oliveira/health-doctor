class PatientsBackofficeController < ApplicationController
  before_action :authenticate_patient!
  layout 'patients_backoffice'
end
