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

ActiveRecord::Schema.define(version: 2022_04_23_201051) do

  create_table "admins", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "feedbacks", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patient_id"
    t.bigint "therapist_id"
    t.index ["patient_id"], name: "index_feedbacks_on_patient_id"
    t.index ["therapist_id"], name: "index_feedbacks_on_therapist_id"
  end

  create_table "medications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "drug_name"
    t.text "prescription"
    t.integer "usage_interval"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "patient_id"
    t.index ["patient_id"], name: "index_medications_on_patient_id"
  end

  create_table "moods", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "hours_slept"
    t.string "depressed"
    t.string "anxiety"
    t.integer "irritability_level"
    t.integer "elevated_level"
    t.boolean "psychotic_symptoms"
    t.string "weather"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "patient_id"
    t.string "activity"
    t.text "mood_note"
    t.index ["patient_id"], name: "index_moods_on_patient_id"
    t.index ["user_id"], name: "index_moods_on_user_id"
  end

  create_table "patients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.string "password_digest"
    t.string "location"
    t.integer "age"
    t.string "occupation"
    t.string "gender"
    t.string "image_url"
    t.string "mental_health_status"
    t.string "mental_health_facility"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.bigint "therapist_id"
    t.index ["therapist_id"], name: "index_patients_on_therapist_id"
  end

  create_table "therapists", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.string "gender"
    t.string "specialization"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "location"
    t.integer "age"
    t.string "occupation"
    t.string "gender"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "feedbacks", "patients"
  add_foreign_key "feedbacks", "therapists"
  add_foreign_key "medications", "patients"
  add_foreign_key "moods", "patients"
  add_foreign_key "moods", "users"
  add_foreign_key "patients", "therapists"
end
