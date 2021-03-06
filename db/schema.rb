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

ActiveRecord::Schema.define(version: 20170926123544) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string "name"
    t.date "deadline"
    t.text "description"
    t.bigint "evaluation_id"
    t.bigint "classroom_id"
    t.bigint "teacher_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "specs"
    t.integer "status", default: 0
    t.string "attachment"
    t.index ["classroom_id"], name: "index_assignments_on_classroom_id"
    t.index ["evaluation_id"], name: "index_assignments_on_evaluation_id"
    t.index ["teacher_id"], name: "index_assignments_on_teacher_id"
    t.index ["topic_id"], name: "index_assignments_on_topic_id"
  end

  create_table "classrooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "evaluation_processes", force: :cascade do |t|
    t.bigint "assignment_id"
    t.integer "evaluated_id"
    t.integer "evaluator_id"
    t.index ["assignment_id"], name: "index_evaluation_processes_on_assignment_id"
    t.index ["evaluated_id"], name: "index_evaluation_processes_on_evaluated_id"
    t.index ["evaluator_id"], name: "index_evaluation_processes_on_evaluator_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "readability"
    t.integer "referencing"
    t.integer "knowledge_of_topic"
    t.integer "final_grade"
    t.text "feeback_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "paper_id"
    t.index ["paper_id"], name: "index_evaluations_on_paper_id"
  end

  create_table "papers", force: :cascade do |t|
    t.bigint "assignment_id"
    t.bigint "student_id"
    t.bigint "evaluation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "attachment"
    t.string "title"
    t.boolean "evaluated", default: false, null: false
    t.index ["assignment_id"], name: "index_papers_on_assignment_id"
    t.index ["evaluation_id"], name: "index_papers_on_evaluation_id"
    t.index ["student_id"], name: "index_papers_on_student_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.date "date_of_birth"
    t.text "description"
    t.bigint "classroom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "photo"
    t.index ["classroom_id"], name: "index_students_on_classroom_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "photo"
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "teacher_id"
    t.index ["program_id"], name: "index_topics_on_program_id"
    t.index ["teacher_id"], name: "index_topics_on_teacher_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assignments", "classrooms"
  add_foreign_key "assignments", "evaluations"
  add_foreign_key "assignments", "teachers"
  add_foreign_key "assignments", "topics"
  add_foreign_key "evaluation_processes", "assignments"
  add_foreign_key "evaluations", "papers"
  add_foreign_key "papers", "assignments"
  add_foreign_key "papers", "evaluations"
  add_foreign_key "papers", "students"
  add_foreign_key "students", "classrooms"
  add_foreign_key "topics", "programs"
  add_foreign_key "topics", "teachers"
end
