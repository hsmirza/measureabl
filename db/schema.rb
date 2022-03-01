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

ActiveRecord::Schema.define(version: 2021_09_21_131415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insights", force: :cascade do |t|
    t.decimal "total_area", default: "0.0"
    t.decimal "commercial_area", default: "0.0"
    t.decimal "residential_area", default: "0.0"
    t.decimal "common_area", default: "0.0"
    t.string "insightable_type"
    t.bigint "insightable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["insightable_type", "insightable_id"],

    t.index ["insightable_type"]
    t.index ["insightable_id"]

     name: "index_insights_on_insightable_type_and_insightable_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "portfolio_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_sites_on_portfolio_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name", null: false
    t.integer "space_type", default: 0, null: false
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "area", default: "0.0"
    t.index ["site_id"], name: "index_spaces_on_site_id"
    t.index ["space_type"], name: "index_spaces_on_space_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "portfolios", "users"
  add_foreign_key "sites", "portfolios"
  add_foreign_key "spaces", "sites"
end
