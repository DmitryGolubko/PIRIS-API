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

ActiveRecord::Schema.define(version: 20181118121907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "currency_id"
    t.string "name"
    t.string "number"
    t.string "code"
    t.integer "activity"
    t.integer "account_type"
    t.decimal "debit", precision: 25, scale: 10, default: "0.0"
    t.decimal "credit", precision: 25, scale: 10, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_accounts_on_client_id"
    t.index ["currency_id"], name: "index_accounts_on_currency_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
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
    t.boolean "retired", default: false, null: false
    t.integer "salary", default: 0, null: false
    t.boolean "military", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "city_id", null: false
    t.bigint "civil_status_id", null: false
    t.bigint "country_id", null: false
    t.bigint "disability_id", null: false
    t.index ["city_id"], name: "index_clients_on_city_id"
    t.index ["civil_status_id"], name: "index_clients_on_civil_status_id"
    t.index ["country_id"], name: "index_clients_on_country_id"
    t.index ["disability_id"], name: "index_clients_on_disability_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name"
    t.string "code"
  end

  create_table "deposit_contracts", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "deposit_id"
    t.date "starts_at"
    t.date "ends_at"
    t.integer "status", default: 0
    t.decimal "sum", precision: 15, scale: 2, default: "0.0"
    t.integer "percent_account_id"
    t.integer "current_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_deposit_contracts_on_client_id"
    t.index ["deposit_id"], name: "index_deposit_contracts_on_deposit_id"
  end

  create_table "deposit_types", force: :cascade do |t|
    t.string "name"
    t.integer "revocable"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "deposits", force: :cascade do |t|
    t.bigint "deposit_type_id"
    t.bigint "currency_id"
    t.integer "duration"
    t.decimal "percent", precision: 6, scale: 2
    t.index ["currency_id"], name: "index_deposits_on_currency_id"
    t.index ["deposit_type_id"], name: "index_deposits_on_deposit_type_id"
  end

  create_table "disabilities", force: :cascade do |t|
    t.string "name"
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "sum", precision: 25, scale: 10, default: "0.0"
    t.integer "source_account_id"
    t.integer "destination_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "clients", "cities"
  add_foreign_key "clients", "civil_statuses"
  add_foreign_key "clients", "countries"
  add_foreign_key "clients", "disabilities"
end
