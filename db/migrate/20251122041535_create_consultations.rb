class CreateConsultations < ActiveRecord::Migration[8.1]
  def change
    create_table :consultations do |t|
      t.references :patient, null: false, foreign_key: true
      t.datetime :date_time
      t.text :notes

      t.timestamps
    end
  end
end
