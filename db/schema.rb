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

ActiveRecord::Schema.define(version: 2022_01_10_160433) do

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "team_id", null: false
    t.integer "position_id", null: false
    t.index ["position_id"], name: "index_players_on_position_id"
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rushings", force: :cascade do |t|
    t.float "attempts_per_game"
    t.integer "attempts"
    t.integer "yards"
    t.float "yards_per_attempt"
    t.float "yards_per_game"
    t.integer "touchdowns"
    t.integer "longest"
    t.integer "first_downs"
    t.float "first_down_percentage"
    t.integer "twenty_plus_yards"
    t.integer "forty_plus_yards"
    t.integer "fumbles"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "player_id", null: false
    t.index ["player_id"], name: "index_rushings_on_player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "players", "positions"
  add_foreign_key "players", "teams"
  add_foreign_key "rushings", "players"
end
