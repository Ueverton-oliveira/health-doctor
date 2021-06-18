class AppointmentsController < ApplicationController
  layout 'appointments'

  def index
    @appointments = Appointment.all.page(params[:page]).per(10)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(params_appointment)
    if @appointment .save!
      redirect_to  appointments_path, notice: "Médico criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  private

  def params_appointment
    params.require(:appointment).permit(:starts_at, :ends_at)
  end
end
