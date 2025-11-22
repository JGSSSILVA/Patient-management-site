class AddFieldsToConsultations < ActiveRecord::Migration[8.1]
  def change
    add_column :consultations, :location, :string
    add_column :consultations, :summary, :text
  end
end
