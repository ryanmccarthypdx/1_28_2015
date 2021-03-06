# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150204182231) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logged_responses", force: :cascade do |t|
    t.integer "session_id"
    t.integer "question_id"
    t.integer "response_id"
  end

  create_table "questions", force: :cascade do |t|
    t.integer "survey_id"
    t.string  "query"
    t.integer "response_set_id"
  end

  create_table "response_sets", force: :cascade do |t|
    t.string  "name"
    t.boolean "canned"
  end

  create_table "response_sets_responses", force: :cascade do |t|
    t.integer "response_id"
    t.integer "response_set_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "answer"
  end

  create_table "sessions", force: :cascade do |t|
  end

  create_table "surveys", force: :cascade do |t|
    t.string "title"
  end

end
