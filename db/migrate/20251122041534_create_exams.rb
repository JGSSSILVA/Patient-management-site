class CreateExams < ActiveRecord::Migration[8.1]
  def change
    create_table :exams do |t|
      t.references :patient, null: false, foreign_key: true
      t.date :date
      t.string :title
      t.text :notes

      t.timestamps
    end
  end
end
