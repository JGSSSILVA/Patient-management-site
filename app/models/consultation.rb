class Consultation < ApplicationRecord
  belongs_to :patient
  has_many :exams, dependent: :nullify
end
