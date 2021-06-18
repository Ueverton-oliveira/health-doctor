class PatientsBackoffice::PatientsController < PatientsBackofficeController
  before_action :password_verify, only: [:update]
  before_action :set_patient, only: %i[edit update destroy]

  def index
    @patients = Patient.all.page(params[:page]).per(10)
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(params_patient)
    if @patient.save!
      redirect_to patients_backoffice_patients_path, notice: 'Paciente criado com sucesso!'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @patient.update(params_patient)
      redirect_to patients_backoffice_patients_path, notice: 'Paciente atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    if @patient.destroy
      redirect_to patients_backoffice_patients_path, notice: 'Paciente excluído com sucesso!'
    else
      render :index
    end
  end

  private

  def params_patient
    params.require(:patient).permit(:name, :email, :birth_date, :cpf, :password, :password_confirmation)
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  def password_verify
    if params[:patient][:password].blank? && params[:patient][:password_confirmation].blank?
      params[:patient].extract!(:password, :password_confirmation)
    end
  end
end
