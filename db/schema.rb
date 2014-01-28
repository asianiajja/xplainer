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

ActiveRecord::Schema.define(version: 20140125124334) do

  create_table "comments", force: true do |t|
    t.text     "content"
    t.integer  "user_id",    null: false
    t.integer  "topic_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "explanations", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "topic_id",                   null: false
    t.boolean  "author",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", force: true do |t|
    t.string   "name",               default: "",   null: false
    t.integer  "version",            default: 1,    null: false
    t.boolean  "public",             default: true, null: false
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participations", force: true do |t|
    t.integer  "user_id",                    null: false
    t.integer  "lecture_id",                 null: false
    t.boolean  "online",     default: false, null: false
    t.boolean  "creator",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.text     "content"
    t.integer  "lecture_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "supports", force: true do |t|
    t.integer  "question_id",                 null: false
    t.integer  "user_id",                     null: false
    t.boolean  "answered",    default: false, null: false
    t.boolean  "creator",     default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "name",        default: "", null: false
    t.text     "content",     default: "", null: false
    t.integer  "version",     default: 1,  null: false
    t.integer  "lecture_id",               null: false
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name",                   default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
