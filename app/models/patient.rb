class Patient < ApplicationRecord
  has_many :exams, dependent: :destroy
  has_many :consultations, dependent: :destroy
  has_many :documents, dependent: :destroy
  
  before_create :set_registration_date

  private
    def set_registration_date
      self.registration_date = Time.current
    end
end
