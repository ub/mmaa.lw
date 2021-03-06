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

ActiveRecord::Schema.define(version: 20180415002342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_applications", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "meetup_event_id"
    t.string "name"
    t.text "description"
    t.string "tags", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "duration"
    t.index ["meetup_event_id"], name: "index_activity_applications_on_meetup_event_id"
    t.index ["user_id"], name: "index_activity_applications_on_user_id"
  end

  create_table "meetup_events", force: :cascade do |t|
    t.text "description"
    t.datetime "start_time"
    t.string "place"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "provider"
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin_flag", default: false
    t.text "contact"
  end

  add_foreign_key "activity_applications", "meetup_events"
  add_foreign_key "activity_applications", "users"
end
