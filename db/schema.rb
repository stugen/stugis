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

ActiveRecord::Schema.define(version: 20180814064244) do

  create_table "faculties", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stugen", force: :cascade do |t|
    t.string "label"
    t.string "abbreviation", default: ""
    t.string "description", default: ""
    t.integer "faculty_id"
    t.string "picture", default: ""
    t.string "website", default: ""
    t.string "email", default: ""
    t.string "telephone", default: ""
    t.string "building", default: ""
    t.string "room", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "facebook", default: ""
    t.string "twitter", default: ""
    t.string "youtube", default: ""
    t.string "instagram", default: ""
    t.string "pinterest", default: ""
    t.string "snapchat", default: ""
    t.string "tumblr", default: ""
    t.boolean "confirmed", default: false
    t.index ["faculty_id"], name: "index_stugen_on_faculty_id"
  end

end
