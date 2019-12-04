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

ActiveRecord::Schema.define(version: 2017_09_02_154010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "contrary"
    t.string "answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.integer "context_id"
    t.text "objection_statements", default: [], array: true
    t.text "objection_replies", default: [], array: true
    t.index ["context_id"], name: "index_articles_on_context_id"
  end

  create_table "contexts", id: :serial, force: :cascade do |t|
    t.integer "part_id"
    t.integer "treatise_id"
    t.integer "question_id"
    t.integer "article_id"
    t.integer "number_in_part"
    t.integer "number_in_treatise"
    t.integer "number_in_question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parts", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "prologue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "summa_theologica_id"
    t.integer "number_of_articles"
  end

  create_table "questions", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "treatise_id"
    t.integer "number_of_articles"
  end

  create_table "summa_theologicas", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatises", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "prologue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "part_id"
    t.integer "number_of_articles"
  end

  add_foreign_key "articles", "contexts"
end
