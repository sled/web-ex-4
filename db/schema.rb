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

ActiveRecord::Schema.define(version: 20140523063715) do

  create_table "events", force: true do |t|
    t.integer  "group_id"
    t.string   "name",              limit: 50
    t.string   "location"
    t.datetime "start_date"
    t.string   "duration",          limit: 50
    t.text     "description"
    t.integer  "confirmed_at"
    t.string   "photo_id"
    t.string   "photo_author"
    t.string   "photo_profile_url"
    t.string   "cached_thumb_url"
    t.string   "cached_photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events_users", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id", "user_id"], name: "index_events_users_on_event_id_and_user_id", unique: true
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id"

  create_table "groups", force: true do |t|
    t.integer  "owner_id"
    t.string   "name",       limit: 50
    t.string   "hometown",   limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups_users", id: false, force: true do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", unique: true
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id"

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "nickname"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "email",                          null: false
    t.string   "confirmation_token", limit: 128
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "remember_token",     limit: 128, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email", "encrypted_password"], name: "index_users_on_email_and_encrypted_password"
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
