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

ActiveRecord::Schema.define(version: 2020_07_14_145708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", default: "2020-07-14 14:58:55", null: false
    t.datetime "updated_at", default: "2020-07-14 14:58:55", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "author_name"
    t.text "body"
    t.bigint "article_id"
    t.datetime "created_at", default: "2020-07-14 14:58:55", null: false
    t.datetime "updated_at", default: "2020-07-14 14:58:55", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  add_foreign_key "comments", "articles"
end
