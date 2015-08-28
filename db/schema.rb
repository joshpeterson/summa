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

ActiveRecord::Schema.define(version: 20150826101324) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "contrary"
    t.string   "answer"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.integer  "context_id"
  end

  add_index "articles", ["context_id"], name: "index_articles_on_context_id"

  create_table "contexts", force: :cascade do |t|
    t.integer  "part_id"
    t.integer  "treatise_id"
    t.integer  "question_id"
    t.integer  "article_id"
    t.integer  "number_in_part"
    t.integer  "number_in_treatise"
    t.integer  "number_in_question"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "objections", force: :cascade do |t|
    t.string   "statement"
    t.string   "reply"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "article_id"
  end

  create_table "parts", force: :cascade do |t|
    t.string   "title"
    t.string   "prologue"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "summa_theologica_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "treatise_id"
  end

  create_table "summa_theologicas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatises", force: :cascade do |t|
    t.string   "title"
    t.string   "prologue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "part_id"
  end

end
