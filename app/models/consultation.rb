class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :exams, dependent: :nullify
  
  validate :no_overlapping_appointments, if: :date_time?
  
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
