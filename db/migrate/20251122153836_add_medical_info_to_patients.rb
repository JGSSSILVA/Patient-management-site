class AddMedicalInfoToPatients < ActiveRecord::Migration[8.1]
  def change
    add_column :patients, :allergies, :text
    add_column :patients, :current_medications, :text
  end
end
