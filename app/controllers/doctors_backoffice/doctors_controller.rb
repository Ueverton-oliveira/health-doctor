class DoctorsBackoffice::DoctorsController < DoctorsBackofficeController
  before_action :password_verify, only: [:update]
  before_action :set_doctor, only: [:edit, :update, :destroy]

  def index
    @doctors = Doctor.all.page(params[:page]).per(10)
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(params_doctor)
    if @doctor.save!
      redirect_to  doctors_backoffice_doctors_path, notice: "Médico criado com sucesso!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @doctor.update(params_doctor)
      redirect_to  doctors_backoffice_doctors_path, notice: "Médico atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    if @doctor.destroy
      redirect_to  doctors_backoffice_doctors_path, notice: "Médico excluído com sucesso!"
    else
      render :index
    end
  end

  private

  def params_doctor
    params.require(:doctor).permit(:name, :email, :crm, :crm_uf, :password, :password_confirmation)
  end

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def password_verify
    if params[:doctor][:password].blank? && params[:doctor][:password_confirmation].blank?
      params[:doctor].extract!(:password, :password_confirmation)
    end
  end
end
