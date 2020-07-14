# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_14_174207) do

  create_table "approved_orders", force: :cascade do |t|
    t.integer "order_client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "bot_token"
    t.index ["order_client_id"], name: "index_approved_orders_on_order_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fantasy_name"
    t.string "corporate_name"
    t.string "email"
    t.string "cnpj"
    t.string "address"
    t.integer "client_id", null: false
    t.string "token"
    t.index ["client_id"], name: "index_companies_on_client_id"
    t.index ["cnpj"], name: "index_companies_on_cnpj", unique: true
    t.index ["corporate_name"], name: "index_companies_on_corporate_name", unique: true
    t.index ["email"], name: "index_companies_on_email", unique: true
    t.index ["fantasy_name"], name: "index_companies_on_fantasy_name", unique: true
    t.index ["token"], name: "index_companies_on_token", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "order_clients", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "plan_id"
    t.integer "client_id"
    t.string "token"
    t.index ["client_id"], name: "index_order_clients_on_client_id"
    t.index ["token"], name: "index_order_clients_on_token", unique: true
  end

  create_table "plans", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "promos", force: :cascade do |t|
    t.string "title"
    t.integer "discount"
    t.date "start_date"
    t.date "end_date"
    t.integer "limit_order", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.integer "employee_id", null: false
    t.index ["employee_id"], name: "index_promos_on_employee_id"
  end

  create_table "rejected_orders", force: :cascade do |t|
    t.integer "order_client_id", null: false
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_client_id"], name: "index_rejected_orders_on_order_client_id"
  end

  add_foreign_key "approved_orders", "order_clients"
  add_foreign_key "companies", "clients"
  add_foreign_key "order_clients", "clients"
  add_foreign_key "promos", "employees"
  add_foreign_key "rejected_orders", "order_clients"
end
