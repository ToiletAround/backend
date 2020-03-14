# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_14_174217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.bigint "toilet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["toilet_id"], name: "index_locations_on_toilet_id"
  end

  create_table "prices", force: :cascade do |t|
    t.bigint "toilet_id", null: false
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["toilet_id"], name: "index_prices_on_toilet_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.bigint "toilet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["toilet_id"], name: "index_resources_on_toilet_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "weekday"
    t.time "start"
    t.time "end"
    t.bigint "toilet_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["toilet_id"], name: "index_schedules_on_toilet_id"
  end

  create_table "toilets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "locations", "toilets"
  add_foreign_key "prices", "toilets"
  add_foreign_key "resources", "toilets"
  add_foreign_key "schedules", "toilets"
end
