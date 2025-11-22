# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_22_153836) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "consultations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "date_time"
    t.string "location"
    t.text "notes"
    t.integer "patient_id", null: false
    t.text "summary"
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_consultations_on_patient_id"
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "patient_id", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_documents_on_patient_id"
  end

  create_table "exams", force: :cascade do |t|
    t.integer "consultation_id"
    t.datetime "created_at", null: false
    t.date "date"
    t.text "notes"
    t.integer "patient_id", null: false
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["consultation_id"], name: "index_exams_on_consultation_id"
    t.index ["patient_id"], name: "index_exams_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.text "allergies"
    t.text "contact_info"
    t.datetime "created_at", null: false
    t.text "current_medications"
    t.date "dob"
    t.string "identifier"
    t.text "medical_notes"
    t.string "name"
    t.text "reason_for_visit"
    t.datetime "registration_date"
    t.datetime "updated_at", null: false
    t.index ["identifier"], name: "index_patients_on_identifier"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "consultations", "patients"
  add_foreign_key "documents", "patients"
  add_foreign_key "exams", "consultations"
  add_foreign_key "exams", "patients"
end
