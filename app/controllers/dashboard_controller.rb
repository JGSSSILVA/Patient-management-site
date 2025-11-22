class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @upcoming_appointments = Consultation.where("date_time > ?", Time.current).order(date_time: :asc)
    @calendar_consultations = Consultation.where(date_time: Time.current.beginning_of_month..Time.current.end_of_month)
    
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
end
