ActiveRecord::Schema.define(version: 2020_03_14_174217) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "toilets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
end
