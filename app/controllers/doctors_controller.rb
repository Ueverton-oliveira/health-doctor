class DoctorsController < ApplicationController
  def index
    @doctor = Doctor.all
  end

  def new
    @doctor = Doctor.new
  end
end
