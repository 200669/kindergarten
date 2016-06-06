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

ActiveRecord::Schema.define(version: 20160606162756) do

  create_table "children", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "lastname",   limit: 255, null: false
    t.date     "birthdate",              null: false
    t.string   "pesel",      limit: 11,  null: false
    t.string   "barcode",    limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "group_id",   limit: 4
  end

  add_index "children", ["group_id"], name: "index_children_on_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "meal_types", force: :cascade do |t|
    t.integer  "ordinal",    limit: 4
    t.string   "name",       limit: 255
    t.float    "price",      limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "stay_id",      limit: 4
    t.integer  "meal_type_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "meals", ["meal_type_id"], name: "fk_rails_604de882b4", using: :btree
  add_index "meals", ["stay_id"], name: "index_meals_on_stay_id", using: :btree

  create_table "settings", force: :cascade do |t|
    t.time     "free_stay_begin"
    t.time     "free_stay_end"
    t.float    "stay_price_per_hour", limit: 24
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "stays", force: :cascade do |t|
    t.datetime "start"
    t.datetime "end"
    t.integer  "child_id",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "stays", ["child_id"], name: "index_stays_on_child_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",           limit: 255
    t.string   "name",            limit: 255
    t.string   "lastname",        limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "children", "groups"
  add_foreign_key "meals", "meal_types"
  add_foreign_key "meals", "stays"
  add_foreign_key "stays", "children"
end
