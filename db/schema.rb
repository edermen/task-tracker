
ActiveRecord::Schema.define(version: 20151112154230) do

  create_table "project_members", force: :cascade do |t|
    t.integer  "project_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "project_members", ["project_id", "user_id"], name: "index_project_members_on_project_id_and_user_id", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "parent_id",   limit: 4
    t.string   "name",        limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "projects", ["name"], name: "index_projects_on_name", using: :btree
  add_index "projects", ["parent_id"], name: "index_projects_on_parent_id", using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.string   "status",     limit: 255, default: "0"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "user_tasks", force: :cascade do |t|
    t.integer  "task_id",           limit: 4
    t.integer  "project_member_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_tasks", ["task_id", "project_member_id"], name: "index_user_tasks_on_task_id_and_project_member_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",            limit: 255
    t.string   "email",            limit: 255, null: false
    t.string   "crypted_password", limit: 255
    t.string   "salt",             limit: 255
    t.integer  "role_id",          limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "users", ["email", "role_id"], name: "index_users_on_email_and_role_id", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "tasks", "projects"
end
