class DashboardController < ApplicationController
  layout 'dashboard'
  def index; end

  def search_doctor
    @doctor = Doctor.search_by(params[:doctor])
  end
end
