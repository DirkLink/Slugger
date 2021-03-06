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

ActiveRecord::Schema.define(version: 20150729175213) do

  create_table "badges", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "badge_name"
    t.string   "description"
    t.string   "image_url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cars", force: :cascade do |t|
    t.integer  "driver_id"
    t.string   "color"
    t.string   "make"
    t.string   "model"
    t.string   "year"
    t.integer  "seats_available"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "driver_id"
    t.integer  "rider_one_id"
    t.integer  "rider_two_id"
    t.integer  "rider_three_id"
    t.integer  "rider_four_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "morning_time"
    t.datetime "evening_time"
    t.string   "home_locale"
    t.string   "work_locale"
    t.string   "day"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "home_lat"
    t.float    "home_lng"
    t.float    "work_lat"
    t.float    "work_lng"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "music"
    t.string   "talking"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.decimal  "level"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "driver"
    t.text     "bio"
    t.text     "preferences"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
