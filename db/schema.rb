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

ActiveRecord::Schema.define(version: 20160121203033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.integer  "rider_id"
    t.integer  "trip_id"
    t.integer  "rating",      default: 0
    t.text     "review_body"
    t.integer  "driver_id",               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "driver_id"
    t.string   "origin",                  null: false
    t.string   "destination",             null: false
    t.string   "meet_point",              null: false
    t.integer  "rate",        default: 0
    t.string   "car_make"
    t.string   "car_model"
    t.string   "car_plate"
    t.integer  "avail_cap",   default: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                               null: false
    t.string   "last_name",                                null: false
    t.date     "birthdate"
    t.string   "gender"
    t.string   "address"
    t.string   "town"
    t.string   "state"
    t.string   "zip"
    t.string   "d_lisence"
    t.string   "phone"
    t.integer  "rating"
    t.integer  "d_trip_count"
    t.integer  "r_trip_count"
    t.string   "role",                   default: "rider"
    t.string   "profile_photo"
    t.string   "email",                  default: "",      null: false
    t.string   "encrypted_password",     default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
