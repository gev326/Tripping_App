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

ActiveRecord::Schema.define(version: 20151105033323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "date"
    t.string   "event"
    t.string   "time"
    t.string   "location"
    t.string   "information"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "trip_id"
  end

  add_index "activities", ["trip_id"], name: "index_activities_on_trip_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.integer  "balance"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "guests", ["trip_id"], name: "index_guests_on_trip_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "location"
    t.string   "date"
    t.string   "picture"
    t.string   "mode"
    t.string   "departure_location"
    t.string   "departure_time"
    t.string   "return_location"
    t.string   "return_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "profile_pic",     default: "default_img.jpg"
    t.integer  "balance",         default: 0
    t.string   "password_digest"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_foreign_key "activities", "trips"
  add_foreign_key "guests", "trips"
  add_foreign_key "trips", "users"
end
