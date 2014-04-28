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

ActiveRecord::Schema.define(version: 20140428222201) do

  create_table "buddy_circle_memberships", force: true do |t|
    t.string   "user_id",         null: false
    t.string   "buddy_circle_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buddy_circles", force: true do |t|
    t.string   "name",       null: false
    t.integer  "owner_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", force: true do |t|
    t.integer  "post_id",    null: false
    t.string   "url",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "links", ["post_id"], name: "index_links_on_post_id"

  create_table "post_shares", force: true do |t|
    t.integer  "post_id",          null: false
    t.integer  "friend_circle_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_shares", ["friend_circle_id"], name: "index_post_shares_on_friend_circle_id"
  add_index "post_shares", ["post_id"], name: "index_post_shares_on_post_id"

  create_table "posts", force: true do |t|
    t.integer  "author_id",  null: false
    t.text     "body",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id"

  create_table "users", force: true do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "token",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
