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

ActiveRecord::Schema.define(version: 20141211085739) do

  create_table "comments", force: true do |t|
    t.text     "message"
    t.integer  "user_id"
    t.integer  "post_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "url_img"
    t.string   "url_film"
    t.integer  "user_id"
    t.boolean  "found",      default: false, null: false
    t.integer  "difficulty", default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "film_name"
    t.boolean  "closed",     default: false
    t.text     "clue"
  end

  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "users", force: true do |t|
    t.string   "pseudo"
    t.string   "nom"
    t.string   "prenom"
    t.string   "email"
    t.string   "url_img",         default: "http://corentinflach.fr/img/profil_default.jpg"
    t.string   "password"
    t.integer  "credits",         default: 0
    t.integer  "r_credits",       default: 0
    t.boolean  "king",            default: false,                                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

end
