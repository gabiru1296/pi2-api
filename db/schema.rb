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

ActiveRecord::Schema.define(version: 20171127015853) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cluster_counter_types", force: :cascade do |t|
    t.integer "code"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cluster_counters", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "cluster_id"
    t.bigint "cluster_counter_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_counter_type_id"], name: "index_cluster_counters_on_cluster_counter_type_id"
    t.index ["cluster_id"], name: "index_cluster_counters_on_cluster_id"
  end

  create_table "cluster_metrics", force: :cascade do |t|
    t.float "weight"
    t.float "length"
    t.float "tca"
    t.bigint "cluster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cluster_id"], name: "index_cluster_metrics_on_cluster_id"
  end

  create_table "clusters", force: :cascade do |t|
    t.integer "total"
    t.boolean "is_done"
    t.integer "current_total"
    t.bigint "fish_type_id"
    t.bigint "tank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "end_date"
    t.float "initial_weight"
    t.float "current_tca"
    t.index ["fish_type_id"], name: "index_clusters_on_fish_type_id"
    t.index ["tank_id"], name: "index_clusters_on_tank_id"
  end

  create_table "consumptions", force: :cascade do |t|
    t.float "quantity"
    t.bigint "lot_id"
    t.bigint "feeder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "dose_value"
    t.bigint "cluster_id"
    t.index ["cluster_id"], name: "index_consumptions_on_cluster_id"
    t.index ["feeder_id"], name: "index_consumptions_on_feeder_id"
    t.index ["lot_id"], name: "index_consumptions_on_lot_id"
  end

  create_table "feeder_clocks", force: :cascade do |t|
    t.integer "hour"
    t.integer "minute"
    t.bigint "feeder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quatity"
    t.index ["feeder_id"], name: "index_feeder_clocks_on_feeder_id"
  end

  create_table "feeders", force: :cascade do |t|
    t.string "nickname"
    t.bigint "tank_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nivel", default: "low", null: false
    t.boolean "need_reload", default: true, null: false
    t.boolean "need_setup", default: true, null: false
    t.integer "network_code"
    t.integer "food_level"
    t.integer "battery_level"
    t.integer "weight"
    t.index ["tank_id"], name: "index_feeders_on_tank_id"
  end

  create_table "fish_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "migrations", force: :cascade do |t|
    t.string "add_batery_level_to_feeder"
    t.integer "betery_level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensor_errors", force: :cascade do |t|
    t.integer "error"
    t.bigint "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sensor_id"], name: "index_sensor_errors_on_sensor_id"
  end

  create_table "sensor_records", force: :cascade do |t|
    t.float "value"
    t.bigint "sensor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "register_date"
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
    t.integer "sensor_code"
    t.integer "sensor_type"
    t.index ["feeder_id"], name: "index_sensors_on_feeder_id"
  end

  create_table "tanks", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cluster_counters", "cluster_counter_types"
  add_foreign_key "cluster_counters", "clusters"
  add_foreign_key "cluster_metrics", "clusters"
  add_foreign_key "clusters", "fish_types"
  add_foreign_key "clusters", "tanks"
  add_foreign_key "consumptions", "clusters"
  add_foreign_key "consumptions", "feeders"
  add_foreign_key "consumptions", "lots"
  add_foreign_key "feeder_clocks", "feeders"
  add_foreign_key "feeders", "tanks"
  add_foreign_key "sensor_errors", "sensors"
  add_foreign_key "sensor_records", "sensors"
  add_foreign_key "sensors", "feeders"
end
