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

ActiveRecord::Schema.define(version: 20161104162337) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "SetLists_Songs", id: false, force: :cascade do |t|
    t.integer "song_id",     null: false
    t.integer "set_list_id", null: false
    t.integer "order"
  end

  create_table "gig_sets", force: :cascade do |t|
    t.integer  "number"
    t.integer  "gig_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "gig_sets", ["gig_id"], name: "index_gig_sets_on_gig_id", using: :btree

  create_table "gigs", force: :cascade do |t|
    t.string   "name"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "song_instances", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "gig_set_id"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "song_instances", ["gig_set_id"], name: "index_song_instances_on_gig_set_id", using: :btree
  add_index "song_instances", ["song_id"], name: "index_song_instances_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "original_artist"
    t.string   "aka"
    t.boolean  "georgie_main"
    t.boolean  "chris_main"
    t.boolean  "backing_vocals"
    t.boolean  "lead_guitar"
    t.string   "key"
    t.string   "genre"
    t.string   "speed"
    t.text     "notes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "lyrics"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean  "approved"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "gig_sets", "gigs"
  add_foreign_key "song_instances", "gig_sets"
  add_foreign_key "song_instances", "songs"
end
