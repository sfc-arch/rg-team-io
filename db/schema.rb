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

ActiveRecord::Schema.define(version: 20151001201631) do

  create_table "api_keys", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "access_token", limit: 32
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "api_keys", ["access_token"], name: "index_api_keys_on_access_token"
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "type"
  end

  add_index "comments", ["page_id"], name: "index_comments_on_page_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "group_users", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ldap_credentials", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.integer  "uid_number"
    t.integer  "gid_number"
    t.string   "gecos"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ldap_credentials", ["student_id"], name: "index_ldap_credentials_on_student_id", unique: true
  add_index "ldap_credentials", ["user_id"], name: "index_ldap_credentials_on_user_id"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["page_id"], name: "index_likes_on_page_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "meeting_attendances", force: :cascade do |t|
    t.integer  "meeting_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "meeting_attendances", ["meeting_id"], name: "index_meeting_attendances_on_meeting_id"
  add_index "meeting_attendances", ["user_id"], name: "index_meeting_attendances_on_user_id"

  create_table "meetings", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_at",   null: false
    t.datetime "end_at",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "path"
    t.text     "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["content"], name: "index_pages_on_content"
  add_index "pages", ["user_id"], name: "index_pages_on_user_id"

  create_table "presentations", force: :cascade do |t|
    t.string   "title"
    t.integer  "number"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "meeting_id"
  end

  add_index "presentations", ["meeting_id"], name: "index_presentations_on_meeting_id"
  add_index "presentations", ["user_id"], name: "index_presentations_on_user_id"

  create_table "renamed_pages", force: :cascade do |t|
    t.string   "before_path"
    t.string   "after_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "slack_credentials", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "slack_user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "slack_credentials", ["user_id"], name: "index_slack_credentials_on_user_id"

  create_table "upload_files", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "attached_object_id"
    t.string   "attached_object_type"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "icon_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "role",       default: 0, null: false
  end

end
