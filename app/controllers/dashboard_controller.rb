class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    # Week navigation
    @week_offset = params[:week_offset].to_i
    @current_week_start = Date.current.beginning_of_week + @week_offset.weeks
    @current_week_end = @current_week_start.end_of_week
    
    # Fetch appointments for the current week
    @week_appointments = Consultation.where(date_time: @current_week_start.beginning_of_day..@current_week_end.end_of_day)
                                     .order(date_time: :asc)
                                     .includes(:patient)
    
    # Group appointments by date
    @appointments_by_date = @week_appointments.group_by { |appt| appt.date_time.to_date }
    
    @upcoming_appointments = Consultation.where("date_time > ?", Time.current).order(date_time: :asc)
    
  end
end
