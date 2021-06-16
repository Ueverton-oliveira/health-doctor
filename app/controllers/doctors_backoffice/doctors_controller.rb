class DoctorsBackoffice::DoctorsController < DoctorsBackofficeController
  def index
    @doctors = Doctor.all
  end

  def edit
    @doctor = Doctor.find(params[:id])
  end

  def update
    @doctor = Doctor.find(params[:id])
    params_doctor = params.require(:doctor).permit(:name, :email, :crm, :crm_uf, :password, :password_confirmation)
    if @doctor.update(params_doctor)
      redirect_to  doctors_backoffice_doctors_path, notice: "Médico atualizado com sucesso!"
    else
      render :edit
    end
  end
end
