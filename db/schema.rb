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

ActiveRecord::Schema.define(version: 2021_06_07_094017) do

  create_table "match_results", force: :cascade do |t|
    t.integer "year"
    t.string "league"
    t.string "kind"
    t.string "date"
    t.string "time"
    t.integer "home_id"
    t.integer "homescore"
    t.integer "awayscore"
    t.integer "away_id"
    t.string "stadium"
    t.integer "viewers"
    t.string "broadcasts"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["away_id"], name: "index_match_results_on_away_id"
    t.index ["home_id"], name: "index_match_results_on_home_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "match_results", "teams", column: "away_id"
  add_foreign_key "match_results", "teams", column: "home_id"
end
