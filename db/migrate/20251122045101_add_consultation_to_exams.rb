class AddConsultationToExams < ActiveRecord::Migration[8.1]
  def change
    add_reference :exams, :consultation, null: true, foreign_key: true
  end
end
