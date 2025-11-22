class Document < ApplicationRecord
  belongs_to :patient
  has_one_attached :file
end
