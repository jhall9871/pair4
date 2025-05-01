# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_04_05_112635) do
  create_table "bottle_types", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "food_subtypes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "food_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.index ["food_type_id"], name: "index_food_subtypes_on_food_type_id"
    t.index ["name"], name: "index_food_subtypes_on_name", unique: true
  end

  create_table "food_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_food_types_on_name", unique: true
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "food_subtype_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_subtype_id"], name: "index_foods_on_food_subtype_id"
    t.index ["name"], name: "index_foods_on_name", unique: true
  end

  create_table "pairing_scores", force: :cascade do |t|
    t.integer "score"
    t.integer "wine_type_id", null: false
    t.integer "food_subtype_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_subtype_id"], name: "index_pairing_scores_on_food_subtype_id"
    t.index ["wine_type_id"], name: "index_pairing_scores_on_wine_type_id"
  end

  create_table "wine_subtypes", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "wine_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_wine_subtypes_on_name", unique: true
    t.index ["wine_type_id"], name: "index_wine_subtypes_on_wine_type_id"
  end

  create_table "wine_types", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bottle_type_id"
    t.index ["bottle_type_id"], name: "index_wine_types_on_bottle_type_id"
    t.index ["name"], name: "index_wine_types_on_name", unique: true
  end

  add_foreign_key "food_subtypes", "food_types"
  add_foreign_key "foods", "food_subtypes"
  add_foreign_key "pairing_scores", "food_subtypes"
  add_foreign_key "pairing_scores", "wine_types"
  add_foreign_key "wine_subtypes", "wine_types"
  add_foreign_key "wine_types", "bottle_types"
end
