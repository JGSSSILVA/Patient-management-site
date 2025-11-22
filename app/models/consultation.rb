class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :exams, dependent: :nullify
  
  validate :no_overlapping_appointments, if: :date_time?
  
  def google_calendar_url
    return nil unless date_time.present?
    
    # Format: YYYYMMDDTHHMMSS
    start_time = date_time.strftime("%Y%m%dT%H%M%S")
    end_time = (date_time + 1.hour).strftime("%Y%m%dT%H%M%S")
    
    params = {
      action: 'TEMPLATE',
      text: "Consultation: #{patient.name}",
      dates: "#{start_time}/#{end_time}",
      details: "Patient: #{patient.name}\nLocation: #{location}\nNotes: #{notes}",
      location: location || ""
    }
    
    "https://calendar.google.com/calendar/render?" + params.to_query
  end
  
  private
  
  def no_overlapping_appointments
    return unless date_time.present?
    
    # Assume appointments are 1 hour long
    appointment_start = date_time
    appointment_end = date_time + 1.hour
    
    overlapping = Consultation.where.not(id: id)
                               .where("date_time >= ? AND date_time < ?", 
                                      appointment_start - 1.hour, 
                                      appointment_end)
    
    if overlapping.exists?
      errors.add(:date_time, "conflicts with an existing appointment")
    end
  end
end
