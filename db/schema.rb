# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_04_045656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "educations", id: :serial, force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.integer "resume_id", null: false
    t.string "school", limit: 255
    t.string "degree", limit: 255
    t.string "description", limit: 5000
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gpa", limit: 127
    t.index ["uuid"], name: "index_educations_on_uuid", unique: true
  end

  create_table "experiences", id: :serial, force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "company", limit: 255
    t.string "position", limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location", limit: 127
    t.integer "resume_id", null: false
    t.string "description", limit: 5000
    t.index ["uuid"], name: "index_experiences_on_uuid", unique: true
  end

  create_table "links", id: :serial, force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.integer "resume_id", null: false
    t.string "url", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_links_on_uuid", unique: true
  end

  create_table "resumes", id: :serial, force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.integer "user_id", null: false
    t.string "name", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["uuid"], name: "index_resumes_on_uuid", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "uuid", limit: 36, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", limit: 127
    t.string "last_name", limit: 127
    t.string "phone_number", limit: 127
    t.string "resume_email", limit: 255
    t.string "city", limit: 127
    t.string "state", limit: 127
    t.string "zip", limit: 127
    t.string "job_title", limit: 127
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "educations", "resumes"
  add_foreign_key "experiences", "resumes"
  add_foreign_key "links", "resumes"
  add_foreign_key "resumes", "users"
end
