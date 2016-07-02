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

ActiveRecord::Schema.define(version: 20160702125644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bottlers", force: :cascade do |t|
    t.string   "name"
    t.string   "name_url"
    t.string   "url"
    t.text     "description"
    t.boolean  "featured"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "bottlers", ["name_url"], name: "index_bottlers_on_name_url", using: :btree

  create_table "sodas", force: :cascade do |t|
    t.string   "title"
    t.text     "preview"
    t.text     "body"
    t.text     "url"
    t.date     "release_date"
    t.integer  "rating"
    t.boolean  "featured"
    t.string   "title_url"
    t.boolean  "published",          default: false
    t.integer  "bottler_id",                         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "sodas", ["title_url"], name: "index_sodas_on_title_url", using: :btree

  create_table "tagged_sodas", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "soda_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tagged_sodas", ["soda_id"], name: "index_tagged_sodas_on_soda_id", using: :btree
  add_index "tagged_sodas", ["tag_id"], name: "index_tagged_sodas_on_tag_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                        null: false
    t.string   "last_name",                         null: false
    t.string   "email",                             null: false
    t.string   "username",                          null: false
    t.string   "last_login"
    t.string   "datetime"
    t.boolean  "admin",             default: false, null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

  add_foreign_key "tagged_sodas", "sodas"
  add_foreign_key "tagged_sodas", "tags"
end
