class AppointmentsController < ApplicationController
  layout 'appointments'

  def home
    @appointments = Appointment.where(doctor_id: nil, patient_id: nil)
  end

  def index
    @appointments = Appointment.all.page(params[:page]).per(10)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(params_appointment)
    if @appointment.save!
      redirect_to appointments_path, notice: 'Médico criado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @appointment.update(params_appointment)
      redirect_to appointments_path, notice: 'Médico atualizado com sucesso!'
    else
      render :edit
    end
  end

  private

  def params_appointment
    params.require(:appointment).permit(:starts_at, :ends_at, doctor_id, patient_id)
  end

  def event_params
    if !!params[:event] && (params[:event]["start_at(4i)"].present? || params[:event]["start_at(5i)"].present?)
  
      if params[:event][:start_at_date].present?
        start_at_date = params[:event][:start_at_date]
      else
        start_at_date = Date.today
      end
      year  = start_at_date.match(/^(\d{4})[\-\/]/)[1]
      month = start_at_date.match(/[\-\/](\d{2})[\-\/]/)[1]
      day   = start_at_date.match(/[\-\/](\d{2})$/)[1]
      params[:event]["start_at(1i)"] = year
      params[:event]["start_at(2i)"] = month
      params[:event]["start_at(3i)"] = day
    end
  end



  def params_date
    appointment = Datetime.now
    appointment.strftime
  end
end
