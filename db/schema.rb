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

ActiveRecord::Schema.define(version: 20140907034407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "subject"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.integer  "reservation_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "email"
    t.string   "from_add"
    t.string   "to_add"
    t.date     "pickup_date"
    t.string   "pickup_time"
    t.string   "vechile"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "time"
    t.integer  "passengers"
    t.boolean  "meet_greet"
    t.boolean  "over_night_surcharge"
    t.boolean  "child_seat"
    t.boolean  "pet"
    t.string   "company_name"
    t.string   "hour"
    t.string   "service_type"
    t.string   "rid",                  limit: 20, null: false
    t.datetime "purchased_at"
  end

  create_table "special_requests", force: true do |t|
    t.string   "request_type"
    t.string   "request_value"
    t.string   "reservation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",          precision: 8, scale: 2
  end

end
