class DocumentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient

  def create
    @document = @patient.documents.build(document_params)
    if @document.save
      redirect_to @patient, notice: "Document uploaded."
    else
      redirect_to @patient, alert: "Could not upload document."
    end
  end

  def destroy
    @document = @patient.documents.find(params[:id])
    @document.destroy
    redirect_to @patient, notice: "Document deleted."
  end

  private
    def set_patient
      @patient = Patient.find(params[:patient_id])
    end

    def document_params
      params.require(:document).permit(:name, :file)
    end
end
