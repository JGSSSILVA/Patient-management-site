class ExamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient

  def create
    @exam = @patient.exams.build(exam_params)
    if @exam.save
      redirect_to @patient, notice: "Exam added."
    else
      redirect_to @patient, alert: "Could not add exam."
    end
  end
  def update
    @exam = @patient.exams.find(params[:id])
    if @exam.update(exam_params)
      redirect_to @patient, notice: "Exam updated."
    else
      redirect_to @patient, alert: "Could not update exam."
    end
  end

  def destroy
    @exam = @patient.exams.find(params[:id])
    @exam.destroy
    redirect_to @patient, notice: "Exam deleted."
  end

  private
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def exam_params
      params.require(:exam).permit(:title, :date, :notes, :file, :consultation_id)
    end
end
