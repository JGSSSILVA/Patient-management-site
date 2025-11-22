class CreatePatients < ActiveRecord::Migration[8.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.date :dob
      t.text :contact_info
      t.text :medical_notes
      t.string :identifier

      t.timestamps
    end
    add_index :patients, :identifier
  end
end
