# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_04_18_005032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "api_token"
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "password_digest"
    t.datetime "deleted_at"
    t.index ["api_token"], name: "index_accounts_on_api_token", unique: true
    t.index ["deleted_at"], name: "index_accounts_on_deleted_at"
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "links", force: :cascade do |t|
    t.string "url"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.bigint "user_id"
    t.index ["deleted_at"], name: "index_links_on_deleted_at"
    t.index ["user_id"], name: "index_links_on_user_id"
  end

  add_foreign_key "links", "accounts", column: "user_id"
end
