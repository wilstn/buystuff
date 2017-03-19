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

ActiveRecord::Schema.define(version: 20170317083610) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_carts_on_user_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "total_amount"
    t.text     "shipping_address"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "cart_id"
    t.index ["cart_id"], name: "index_orders_on_cart_id", using: :btree
    t.index ["product_id"], name: "index_orders_on_product_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "order_id"
    t.integer  "user_id"
    t.text     "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_payments_on_cart_id", using: :btree
    t.index ["order_id"], name: "index_payments_on_order_id", using: :btree
    t.index ["user_id"], name: "index_payments_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.integer  "remaining_quantity"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "product_image"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
