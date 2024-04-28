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

ActiveRecord::Schema[7.1].define(version: 202404252351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", id: false, force: :cascade do |t|
    t.uuid "feedback_id"
    t.uuid "survey_id"
  end

  create_table "options", id: false, force: :cascade do |t|
    t.uuid "option_id"
    t.string "title"
    t.uuid "question_id"
    t.integer "is_deleted"
  end

  create_table "questions", id: false, force: :cascade do |t|
    t.uuid "question_id"
    t.string "title"
    t.integer "question_type"
    t.uuid "survey_id"
    t.integer "is_deleted"
  end

  create_table "responses", id: false, force: :cascade do |t|
    t.uuid "response_id"
    t.uuid "question_id"
    t.uuid "option_id"
    t.uuid "feedback_id"
    t.string "body"
    t.datetime "creation_time"
    t.integer "is_deleted"
  end

  create_table "surveys", id: false, force: :cascade do |t|
    t.uuid "survey_id"
    t.string "name"
    t.integer "is_deleted"
  end

end
