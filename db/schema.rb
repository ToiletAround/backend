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

  create_table "toilets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
