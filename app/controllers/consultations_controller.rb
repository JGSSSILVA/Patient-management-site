class ConsultationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient

  def create
    @consultation = @patient.consultations.build(consultation_params)
    if @consultation.save
      redirect_to @patient, notice: "Appointment booked successfully."
    else
      redirect_to @patient, alert: "Could not book appointment: #{@consultation.errors.full_messages.join(', ')}"
    end
  end

  def show
    @consultation = @patient.consultations.find(params[:id])
  end

  def update
    @consultation = @patient.consultations.find(params[:id])
    if @consultation.update(consultation_params)
      redirect_to patient_consultation_path(@patient, @consultation), notice: "Consultation updated."
    else
      render :show, alert: "Could not update consultation."
    end
  end

  def destroy
    @consultation = @patient.consultations.find(params[:id])
    @consultation.destroy
    redirect_to @patient, notice: "Consultation deleted."
  end

  private
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def consultation_params
      params.require(:consultation).permit(:date_time, :notes, :location, :summary)
    end
end
