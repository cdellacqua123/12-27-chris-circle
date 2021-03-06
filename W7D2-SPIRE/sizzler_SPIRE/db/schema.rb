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

ActiveRecord::Schema.define(version: 2022_02_09_012534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "product_name", null: false
    t.text "product_description"
    t.float "price", null: false
    t.integer "seller_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["seller_id"], name: "index_items_on_seller_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email"
    t.string "country", null: false
    t.integer "age", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
