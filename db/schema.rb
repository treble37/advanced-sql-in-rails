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

ActiveRecord::Schema.define(version: 20141130020624) do

  create_table "players", force: true do |t|
    t.string   "player_id"
    t.integer  "birth_year"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["player_id"], name: "player_id_idx", using: :btree

  create_table "statistics", force: true do |t|
    t.string   "player_id"
    t.integer  "year"
    t.string   "team"
    t.string   "league"
    t.integer  "games"
    t.integer  "at_bats"
    t.integer  "runs"
    t.integer  "hits"
    t.integer  "doubles"
    t.integer  "triples"
    t.integer  "home_runs"
    t.integer  "runs_batted_in"
    t.integer  "stolen_bases"
    t.integer  "caught_stealing"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "statistics", ["year", "player_id", "league"], name: "year_player_id_league_idx", using: :btree
  add_index "statistics", ["year", "player_id"], name: "year_player_id_idx", using: :btree

  create_table "vw_total_batting_average", id: false, force: true do |t|
    t.string  "player_id"
    t.integer "year"
    t.decimal "total_btg_avg", precision: 36, scale: 4
    t.string  "league"
  end

  create_table "vw_total_batting_averages", id: false, force: true do |t|
    t.string  "player_id"
    t.integer "year"
    t.decimal "total_btg_avg", precision: 36, scale: 4
    t.string  "league"
  end

  create_table "vw_total_home_runs", id: false, force: true do |t|
    t.string  "player_id"
    t.integer "year"
    t.decimal "total_home_runs", precision: 32, scale: 0
    t.string  "league"
  end

  create_table "vw_total_rbis", id: false, force: true do |t|
    t.string  "player_id"
    t.integer "year"
    t.decimal "total_rbis", precision: 32, scale: 0
    t.string  "league"
  end

end
