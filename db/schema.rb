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

ActiveRecord::Schema.define(version: 20151104084916) do

  create_table "project_members", force: :cascade do |t|
    t.integer "project_id", limit: 4
    t.integer "user_id",    limit: 4
  end

  create_table "projects", force: :cascade do |t|
    t.integer  "parent_id",   limit: 4
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "project_id", limit: 4
    t.integer  "status",     limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree

  create_table "user_tasks", force: :cascade do |t|
    t.integer "task_id",            limit: 4
    t.integer "project_members_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 255
    t.string   "email",      limit: 255
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "tasks", "projects"
end
