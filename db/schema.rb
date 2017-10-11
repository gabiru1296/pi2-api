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

ActiveRecord::Schema.define(version: 20171011131611) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feeders", force: :cascade do |t|
    t.string "nickname"
    t.bigint "tank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nivel", default: "low", null: false
    t.boolean "need_reload"
    t.index ["tank_id"], name: "index_feeders_on_tank_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.float "thickness"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lots", force: :cascade do |t|
    t.float "price"
    t.date "validity"
    t.date "buy_date"
    t.float "quantity"
    t.float "current_quantity"
    t.date "end_date"
    t.bigint "food_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_lots_on_food_id"
  end

  create_table "sensor_records", force: :cascade do |t|
    t.float "value"
    t.bigint "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_sensor_records_on_sensor_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "scale"
    t.boolean "is_working"
    t.date "fail_registration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "feeder_id"
    t.index ["feeder_id"], name: "index_sensors_on_feeder_id"
  end

  create_table "tanks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "feeders", "tanks"
  add_foreign_key "sensor_records", "sensors"
  add_foreign_key "sensors", "feeders"
end
