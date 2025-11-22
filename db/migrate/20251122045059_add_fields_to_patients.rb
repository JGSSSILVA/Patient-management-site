class AddFieldsToPatients < ActiveRecord::Migration[8.1]
  def change
    add_column :patients, :registration_date, :datetime
    add_column :patients, :reason_for_visit, :text
  end
end
