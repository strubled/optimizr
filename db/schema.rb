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

ActiveRecord::Schema.define(version: 2020_05_14_180737) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "card_type"
    t.string "logo_url"
    t.integer "signup_bonus_spend_required"
    t.integer "signup_bonus_points_earned"
    t.float "annual_fee"
    t.integer "gas_points_multi"
    t.integer "gas_points_limit"
    t.integer "gas_points_multi_limit"
    t.integer "grocery_points_multi"
    t.integer "grocery_points_limit"
    t.integer "grocery_points_multi_limit"
    t.integer "dining_point_multi"
    t.integer "dining_points_limit"
    t.integer "dining_points_multi_limit"
    t.integer "hotel_points_multi"
    t.integer "hotel_points_limit"
    t.integer "hotel_points_multi_limit"
    t.integer "airfare_points_multi"
    t.integer "airfare_points_limit"
    t.integer "airfare_points_multi_limit"
    t.integer "other_points_multi"
    t.integer "other_points_limit"
    t.integer "other_points_multi_limit"
    t.float "point_value"
    t.integer "sign_up_bonus_cash"
    t.float "gas_cash_rate"
    t.integer "gas_cash_limit"
    t.float "gas_cash_multi_limit"
    t.float "grocery_cash_rate"
    t.integer "grocery_cash_limit"
    t.float "grocery_cash_multi_limit"
    t.float "dining_cash_rate"
    t.integer "dining_cash_limit"
    t.float "dining_cash_multi_limit"
    t.float "hotel_cash_rate"
    t.integer "hotel_cash_limit"
    t.float "hotel_cash_multi_limit"
    t.float "airfare_cash_rate"
    t.integer "airfare_cash_limit"
    t.float "airfare_cash_multi_limit"
    t.float "other_cash_rate"
    t.integer "other_cash_limit"
    t.float "other_cash_multi_limit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "spents", force: :cascade do |t|
    t.float "spend"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
