class PatientsBackoffice::PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end
end
