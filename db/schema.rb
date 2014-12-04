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

ActiveRecord::Schema.define(version: 20141204192945) do

  create_table "rushes", force: true do |t|
    t.date     "date_d"
    t.date     "date_f"
    t.boolean  "special",    default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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