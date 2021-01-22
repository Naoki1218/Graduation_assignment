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

ActiveRecord::Schema.define(version: 2021_01_19_071824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_estimates", force: :cascade do |t|
    t.bigint "estimate_id"
    t.bigint "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_customer_estimates_on_customer_id"
    t.index ["estimate_id"], name: "index_customer_estimates_on_estimate_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estimate_products", force: :cascade do |t|
    t.bigint "estimate_id"
    t.bigint "product_id"
    t.integer "quantity", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_estimate_products_on_estimate_id"
    t.index ["product_id"], name: "index_estimate_products_on_product_id"
  end

  create_table "estimates", force: :cascade do |t|
    t.integer "total_price"
    t.integer "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "deadline"
    t.bigint "user_id"
    t.integer "customer_name", default: 0, null: false
    t.string "product_name"
    t.integer "quantity"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "stock"
    t.integer "unit_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "availability"
  end

  create_table "reasons", force: :cascade do |t|
    t.bigint "estimate_id"
    t.bigint "user_id"
    t.boolean "approval"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estimate_id"], name: "index_reasons_on_estimate_id"
    t.index ["user_id"], name: "index_reasons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "customer_estimates", "customers"
  add_foreign_key "customer_estimates", "estimates"
  add_foreign_key "estimate_products", "estimates"
  add_foreign_key "estimate_products", "products"
  add_foreign_key "reasons", "estimates"
  add_foreign_key "reasons", "users"
end
