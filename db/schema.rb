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

ActiveRecord::Schema.define(version: 20181003145622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "civil_statuses", force: :cascade do |t|
    t.string "name"
  end

  create_table "clients", force: :cascade do |t|
    t.string "surname", default: "", null: false
    t.string "name", default: "", null: false
    t.string "patronymic", default: "", null: false
    t.date "birthdate", null: false
    t.integer "sex", default: 0, null: false
    t.string "passport_series", default: "", null: false
    t.string "passport_number", default: "", null: false
    t.string "place_of_issue", default: "", null: false
    t.date "date_of_issue", null: false
    t.string "id_number", default: "", null: false
    t.string "birth_place", default: "", null: false
    t.string "address", default: "", null: false
    t.string "home_phone", default: "", null: false
    t.string "mobile_phone", default: "", null: false
    t.string "email", default: "", null: false
    t.integer "civil_status", default: 0, null: false
    t.string "country", default: "", null: false
    t.boolean "disabled", default: false, null: false
    t.boolean "retired", default: false, null: false
    t.integer "salary", default: 0, null: false
    t.boolean "military", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id"
    t.index ["city_id"], name: "index_clients_on_city_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "cities"
end
