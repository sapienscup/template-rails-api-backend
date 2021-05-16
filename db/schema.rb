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

ActiveRecord::Schema.define(version: 2021_05_16_184350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_profiles", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_profiles_on_account_id"
    t.index ["profile_id"], name: "index_account_profiles_on_profile_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "password"
    t.string "name"
    t.string "password_digest"
    t.datetime "deleted_at"
    t.string "authentication_token", limit: 30
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_accounts_on_admin_id"
    t.index ["authentication_token"], name: "index_accounts_on_authentication_token", unique: true
    t.index ["deleted_at"], name: "index_accounts_on_deleted_at"
    t.index ["email"], name: "index_accounts_on_email", unique: true
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "groups", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_groups_on_code", unique: true
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

  create_table "profiles", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "deleted_at"
    t.index ["account_id"], name: "index_profiles_on_account_id"
    t.index ["group_id"], name: "index_profiles_on_group_id"
  end

  add_foreign_key "accounts", "admins"
  add_foreign_key "links", "accounts", column: "user_id"
end
