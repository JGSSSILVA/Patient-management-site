class Exam < ApplicationRecord
  belongs_to :patient
  belongs_to :consultation, optional: true
  has_one_attached :file
end
