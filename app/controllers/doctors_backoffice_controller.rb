class DoctorsBackofficeController < ApplicationController
  before_action :authenticate_doctor!
  layout 'doctors_backoffice'
end
