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

ActiveRecord::Schema[8.0].define(version: 2025_05_08_214426) do
  create_table "certifications", force: :cascade do |t|
    t.string "name"
    t.string "institution"
    t.date "issue_date"
    t.date "expiration_date"
    t.string "credential_url"
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_certifications_on_resume_id"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "kind", null: false
    t.string "value", null: false
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id", "kind"], name: "index_contact_infos_on_resume_id_and_kind", unique: true
    t.index ["resume_id"], name: "index_contact_infos_on_resume_id"
  end

  create_table "educations", force: :cascade do |t|
    t.string "institution"
    t.string "degree"
    t.date "start_date"
    t.date "end_date"
    t.string "field"
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_educations_on_resume_id"
  end

  create_table "experiences", force: :cascade do |t|
    t.string "company", null: false
    t.string "position", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.text "description"
    t.text "activities"
    t.text "achievements"
    t.text "tools"
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_experiences_on_resume_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "level"
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_languages_on_resume_id"
  end

  create_table "project_taggings", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_taggings_on_project_id"
    t.index ["tag_id"], name: "index_project_taggings_on_tag_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_time", null: false
    t.date "end_time"
    t.string "position", null: false
    t.text "activities"
    t.text "outstanding"
    t.text "tools"
    t.text "description"
    t.text "activity_description"
    t.string "cover"
    t.string "logo"
    t.string "category"
    t.string "slug"
    t.string "link"
    t.boolean "actual", default: false, null: false
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_projects_on_resume_id"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "resumes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.string "subtitle"
    t.text "summary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name", null: false
    t.string "level"
    t.string "category"
    t.text "description"
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_skills_on_resume_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id", null: false
    t.string "taggable_type", null: false
    t.integer "taggable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.integer "resume_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resume_id"], name: "index_tags_on_resume_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "certifications", "resumes"
  add_foreign_key "contact_infos", "resumes"
  add_foreign_key "educations", "resumes"
  add_foreign_key "experiences", "resumes"
  add_foreign_key "languages", "resumes"
  add_foreign_key "project_taggings", "projects"
  add_foreign_key "project_taggings", "tags"
  add_foreign_key "projects", "resumes"
  add_foreign_key "resumes", "users"
  add_foreign_key "skills", "resumes"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "resumes"
end
