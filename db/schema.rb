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

ActiveRecord::Schema.define(version: 20210407112750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "bank_details", force: :cascade do |t|
    t.string "bank_name", null: false
    t.string "account_name", null: false
    t.bigint "account_number", null: false
    t.string "ifsc_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: :cascade do |t|
    t.string "company_name", null: false
    t.string "address"
    t.string "email"
    t.string "mobilenumber"
    t.string "gstnumber"
    t.string "city"
    t.string "pincode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name"
    t.decimal "unit_price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "unit_qty"
    t.integer "logistics"
  end

  create_table "order_items", force: :cascade do |t|
    t.string "order_id"
    t.string "item_name"
    t.decimal "item_qty"
    t.decimal "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_unit_qty"
    t.integer "item_price"
    t.bigint "orders_id"
    t.integer "item_qtl_number"
    t.integer "item_qtl_decimal"
    t.index ["orders_id"], name: "index_order_items_on_orders_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "customer_id"
    t.string "customer_name"
    t.string "customer_mobilenumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "logisitcs"
    t.integer "order_total"
    t.string "vehicle"
    t.string "invoice_number"
    t.bigint "customers_id"
    t.index ["customers_id"], name: "index_orders_on_customers_id"
  end

  create_table "unique_numbers_generators", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.string "format"
    t.text "settings"
    t.datetime "last_generated_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_unique_numbers_generators_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "mobilenumber"
    t.string "gstnumber"
    t.string "city"
    t.string "pincode"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_items", "orders", column: "orders_id"
end
