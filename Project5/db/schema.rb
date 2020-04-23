# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_23_093732) do

  create_table "applications", force: :cascade do |t|
    t.integer "course_number"
    t.string "lname"
    t.string "fname"
    t.string "phone_number"
    t.string "email"
    t.string "schedule"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "applies", force: :cascade do |t|
    t.string "last_name", limit: 32, null: false
    t.string "course_number"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "email"
    t.string "schedule"
    t.integer "user_id"
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.text "title"
    t.integer "section_number"
    t.string "component"
    t.string "location"
    t.string "time"
    t.string "instructor"
    t.string "session"
    t.integer "course_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "ins_fname"
    t.string "ins_lname"
    t.string "ins_username"
    t.integer "rating"
    t.string "evaluation"
    t.string "ta_fname"
    t.string "ta_lname"
    t.string "ta_username"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "ins_fname"
    t.string "ins_lname"
    t.string "student_fname"
    t.string "student_lname"
    t.string "course_number"
    t.string "section_number"
    t.string "rec_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "ins_username"
  end

  create_table "student_courses", force: :cascade do |t|
    t.string "title"
    t.integer "course_number"
    t.string "grade"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_student_courses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "affiliation"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "applies", "users"
end
