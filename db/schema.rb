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

ActiveRecord::Schema.define(version: 20160328040253) do

  create_table "clubs", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image_url",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "description",   limit: 65535
    t.date     "event_date"
    t.string   "address",       limit: 255
    t.string   "state",         limit: 255
    t.string   "zip",           limit: 255
    t.float    "latitude",      limit: 24
    t.float    "longitude",     limit: 24
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "region",        limit: 255
    t.string   "city",          limit: 255
    t.string   "status",        limit: 255
    t.boolean  "publish"
    t.integer  "event_type_id", limit: 4
    t.float    "lat",           limit: 24
    t.float    "lng",           limit: 24
    t.integer  "club_id",       limit: 4
  end

  add_index "events", ["club_id"], name: "index_events_on_club_id", using: :btree

  create_table "user_clubs", force: :cascade do |t|
    t.integer "manager_id", limit: 4
    t.integer "club_id",    limit: 4
    t.integer "user_id",    limit: 4
  end

  add_index "user_clubs", ["club_id"], name: "index_user_clubs_on_club_id", using: :btree
  add_index "user_clubs", ["user_id"], name: "index_user_clubs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "username",               limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "role",                   limit: 255
    t.string   "type",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "events", "clubs"
  add_foreign_key "user_clubs", "clubs"
  add_foreign_key "user_clubs", "users"
end
