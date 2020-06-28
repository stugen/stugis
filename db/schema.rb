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

ActiveRecord::Schema.define(version: 2020_06_28_182610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "faculties", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label_en"
  end

  create_table "stugen", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "label", null: false
    t.string "abbreviation", default: ""
    t.string "information", default: ""
    t.bigint "faculty_id"
    t.string "website", default: ""
    t.string "email", default: ""
    t.string "telephone", default: ""
    t.string "building", default: ""
    t.string "room", default: ""
    t.string "facebook", default: ""
    t.string "twitter", default: ""
    t.string "youtube", default: ""
    t.string "instagram", default: ""
    t.string "pinterest", default: ""
    t.string "snapchat", default: ""
    t.string "tumblr", default: ""
    t.boolean "confirmed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "verification_token", default: -> { "md5(gen_random_bytes(256))" }
    t.index ["faculty_id"], name: "index_stugen_on_faculty_id"
  end

  add_foreign_key "stugen", "faculties"
end
