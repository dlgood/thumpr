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

ActiveRecord::Schema.define(version: 20150619212504) do

  create_table "stories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.string   "role"
    t.string   "goal"
    t.string   "benefit"
    t.string   "fftext"
    t.integer  "assignee_id"
    t.integer  "priority"
    t.boolean  "visible"
    t.boolean  "completed"
    t.boolean  "blocked"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stories", ["user_id"], name: "index_stories_on_user_id"

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uploader", force: :cascade do |t|
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.integer  "team_id"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
