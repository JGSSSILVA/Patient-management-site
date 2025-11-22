class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[ show edit update destroy ]

  def index
    @patients = Patient.all
    if params[:query].present?
      @patients = @patients.where("name LIKE ?", "%#{params[:query]}%")
    end
    
    if params[:sort].present?
      @patients = @patients.order(params[:sort])
    else
      @patients = @patients.order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @patient = Patient.new
  end

  def edit
  end

  def create
    @patient = Patient.new(patient_params)

    if @patient.save
      redirect_to @patient, notice: "Patient was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @patient.update(patient_params)
      redirect_to @patient, notice: "Patient was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_url, notice: "Patient was successfully destroyed."
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :identifier, :date_of_birth, :contact_info, :medical_notes, :reason_for_visit, :allergies, :current_medications)
    end
end
