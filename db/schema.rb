# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160519002101) do

  create_table "profiles", force: :cascade do |t|
    t.string   "full_name",                      limit: 255
    t.datetime "date_of_birth"
    t.integer  "gender",                         limit: 4
    t.string   "mobile",                         limit: 255
    t.string   "address",                        limit: 255
    t.datetime "time_to_become_member"
    t.integer  "visa_type",                      limit: 4
    t.datetime "i20_expire_date"
    t.integer  "house_leader",                   limit: 4
    t.integer  "group_leader",                   limit: 4
    t.string   "emergency_contact_person",       limit: 255
    t.text     "self_description",               limit: 65535
    t.integer  "marital_status",                 limit: 4
    t.string   "nationality",                    limit: 255
    t.string   "family_member",                  limit: 255
    t.integer  "user_id",                        limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "group_leader?"
    t.boolean  "house_leader?"
    t.boolean  "pastor?"
    t.string   "email",                          limit: 255
    t.string   "home_town",                      limit: 255
    t.string   "image",                          limit: 255
    t.string   "home_town_contact_person",       limit: 255
    t.string   "home_town_contact_person_phone", limit: 255
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "name",        limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.integer  "role_id",                limit: 4,                null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "failed_attempts",        limit: 4,   default: 0,  null: false
    t.string   "unlock_token",           limit: 255
    t.datetime "locked_at"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree

end
