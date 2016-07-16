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

ActiveRecord::Schema.define(version: 20160715053015) do

  create_table "comments", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "news_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "comments", ["news_id"], name: "index_comments_on_news_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "event_notices", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.string   "publisher",  limit: 255
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "event_registrations", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "event_id",           limit: 4
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "applicant_name",     limit: 255
    t.text     "application_reason", limit: 65535
    t.integer  "approved",           limit: 4
  end

  add_index "event_registrations", ["event_id"], name: "index_event_registrations_on_event_id", using: :btree
  add_index "event_registrations", ["user_id"], name: "index_event_registrations_on_user_id", using: :btree

  create_table "event_sermon_reflections", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "content",         limit: 65535
    t.integer  "event_sermon_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id",         limit: 4
  end

  add_index "event_sermon_reflections", ["event_sermon_id"], name: "index_event_sermon_reflections_on_event_sermon_id", using: :btree

  create_table "event_sermons", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "preacher",     limit: 255
    t.datetime "sermon_date"
    t.string   "content",      limit: 255
    t.string   "sermon_audio", limit: 255
    t.string   "sermon_video", limit: 255
    t.integer  "event_id",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "start_time"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.text     "description",            limit: 65535
    t.string   "ministry",               limit: 255
    t.string   "max_number_of_people",   limit: 255
    t.string   "target_people",          limit: 255
    t.integer  "remaining_reservations", limit: 4
    t.datetime "deadline_of_appication"
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject",    limit: 255
    t.string   "to",         limit: 255
    t.string   "cc",         limit: 255
    t.string   "bcc",        limit: 255
    t.text     "content",    limit: 65535
    t.string   "attachment", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "author",     limit: 255
    t.datetime "date"
    t.text     "content",    limit: 65535
    t.string   "image",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "approved?"
    t.integer  "category",   limit: 4
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.text     "content",      limit: 65535
    t.string   "publisher",    limit: 255
    t.datetime "publish_date"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "full_name",                      limit: 255
    t.datetime "date_of_birth"
    t.integer  "gender",                         limit: 4
    t.string   "mobile",                         limit: 255
    t.string   "address",                        limit: 255
    t.datetime "time_to_become_member"
    t.integer  "visa_type",                      limit: 4
    t.datetime "i20_expire_date"
    t.string   "house_leader",                   limit: 255
    t.integer  "group_leader",                   limit: 4
    t.string   "emergency_contact_person",       limit: 255
    t.text     "self_description",               limit: 65535
    t.integer  "marital_status",                 limit: 4
    t.string   "nationality",                    limit: 255
    t.string   "family_member",                  limit: 255
    t.integer  "user_id",                        limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "email",                          limit: 255
    t.string   "home_town",                      limit: 255
    t.string   "image",                          limit: 255
    t.string   "home_town_contact_person",       limit: 255
    t.string   "home_town_contact_person_phone", limit: 255
    t.integer  "is_house_leader",                limit: 4
    t.integer  "is_group_leader",                limit: 4
    t.integer  "is_pastor",                      limit: 4
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", unique: true, using: :btree

  create_table "reflections", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "event_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "reflections", ["event_id"], name: "index_reflections_on_event_id", using: :btree
  add_index "reflections", ["user_id"], name: "index_reflections_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.integer  "name",        limit: 4
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "sermon_reflections", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id",    limit: 4
    t.integer  "sermon_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "public?"
  end

  add_index "sermon_reflections", ["sermon_id"], name: "index_sermon_reflections_on_sermon_id", using: :btree
  add_index "sermon_reflections", ["user_id"], name: "index_sermon_reflections_on_user_id", using: :btree

  create_table "sermon_sign_ins", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "sermon_id",  limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "sermon_sign_ins", ["sermon_id"], name: "index_sermon_sign_ins_on_sermon_id", using: :btree
  add_index "sermon_sign_ins", ["user_id"], name: "index_sermon_sign_ins_on_user_id", using: :btree

  create_table "sermons", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.string   "scripture",    limit: 255
    t.datetime "date"
    t.string   "preacher",     limit: 255
    t.text     "content",      limit: 65535
    t.integer  "category",     limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "sermon_audio", limit: 255
    t.string   "sermon_video", limit: 255
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
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "version_associations", force: :cascade do |t|
    t.integer "version_id",       limit: 4
    t.string  "foreign_key_name", limit: 255, null: false
    t.integer "foreign_key_id",   limit: 4
  end

  add_index "version_associations", ["foreign_key_name", "foreign_key_id"], name: "index_version_associations_on_foreign_key", using: :btree
  add_index "version_associations", ["version_id"], name: "index_version_associations_on_version_id", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",      limit: 255,        null: false
    t.integer  "item_id",        limit: 4,          null: false
    t.string   "event",          limit: 255,        null: false
    t.string   "whodunnit",      limit: 255
    t.text     "object",         limit: 4294967295
    t.datetime "created_at"
    t.text     "object_changes", limit: 4294967295
    t.integer  "transaction_id", limit: 4
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  add_index "versions", ["transaction_id"], name: "index_versions_on_transaction_id", using: :btree

  add_foreign_key "comments", "news"
  add_foreign_key "comments", "users"
  add_foreign_key "event_registrations", "events"
  add_foreign_key "event_registrations", "users"
  add_foreign_key "event_sermon_reflections", "event_sermons"
  add_foreign_key "reflections", "events"
  add_foreign_key "reflections", "users"
  add_foreign_key "sermon_reflections", "sermons"
  add_foreign_key "sermon_reflections", "users"
  add_foreign_key "sermon_sign_ins", "sermons"
  add_foreign_key "sermon_sign_ins", "users"
end
