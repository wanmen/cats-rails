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

ActiveRecord::Schema.define(version: 20131112090526) do

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.string   "url"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.float    "rate",       default: 0.0
    t.integer  "popularity", default: 0
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "books", force: true do |t|
    t.string   "title"
    t.integer  "dbid"
    t.string   "cover"
    t.text     "summary"
    t.string   "isbn"
    t.string   "author"
    t.string   "publisher"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "translator"
    t.float    "rate",       default: 0.0
    t.integer  "popularity", default: 0
  end

  add_index "books", ["user_id"], name: "index_books_on_user_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "follows", force: true do |t|
    t.integer  "user_id"
    t.integer  "followable_id"
    t.string   "followable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type", "user_id"], name: "index_follows_on_followable_id_and_followable_type_and_user_id", unique: true, using: :btree
  add_index "follows", ["followable_id", "followable_type"], name: "index_follows_on_followable_id_and_followable_type", using: :btree
  add_index "follows", ["user_id"], name: "index_follows_on_user_id", using: :btree

  create_table "likes", force: true do |t|
    t.integer  "likeable_id"
    t.string   "likeable_type"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "likes", ["likeable_id", "likeable_type", "user_id"], name: "index_likes_on_likeable_id_and_likeable_type_and_user_id", unique: true, using: :btree
  add_index "likes", ["likeable_id", "likeable_type"], name: "index_likes_on_likeable_id_and_likeable_type", using: :btree
  add_index "likes", ["user_id"], name: "index_likes_on_user_id", using: :btree

  create_table "links", force: true do |t|
    t.integer  "list_id"
    t.integer  "linkable_id"
    t.string   "linkable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.integer  "user_id"
  end

  add_index "links", ["linkable_id", "linkable_type"], name: "index_links_on_linkable_id_and_linkable_type", using: :btree
  add_index "links", ["list_id"], name: "index_links_on_list_id", using: :btree
  add_index "links", ["user_id"], name: "index_links_on_user_id", using: :btree

  create_table "lists", force: true do |t|
    t.string   "title"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "list_type",   default: 0
    t.text     "links_array"
    t.float    "rate",        default: 0.0
    t.integer  "popularity",  default: 0
    t.string   "cover"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "rates", force: true do |t|
    t.integer  "user_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.integer  "star"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type", "user_id"], name: "index_rates_on_rateable_id_and_rateable_type_and_user_id", unique: true, using: :btree
  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["user_id"], name: "index_rates_on_user_id", using: :btree

  create_table "taglinks", force: true do |t|
    t.integer  "tag_id"
    t.integer  "tagable_id"
    t.string   "tagable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "taglinks", ["tag_id"], name: "index_taglinks_on_tag_id", using: :btree
  add_index "taglinks", ["tagable_id", "tagable_type"], name: "index_taglinks_on_tagable_id_and_tagable_type", using: :btree
  add_index "taglinks", ["user_id"], name: "index_taglinks_on_user_id", using: :btree

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent",     default: -1
  end

  create_table "uploads", force: true do |t|
    t.string   "file"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uploads", ["user_id"], name: "index_uploads_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                    null: false
    t.string   "encrypted_password",     default: "",                    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "thumbnail",              default: "/assets/profile.png"
    t.integer  "role",                   default: 0
    t.integer  "department",             default: 0
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.text     "summary"
    t.string   "url"
    t.string   "lecturer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "ownership",  default: 1
    t.float    "rate",       default: 0.0
    t.integer  "popularity", default: 0
  end

  add_index "videos", ["user_id"], name: "index_videos_on_user_id", using: :btree

  create_table "xclubs", force: true do |t|
    t.string   "name"
    t.date     "started"
    t.text     "summary"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "xevents", force: true do |t|
    t.integer  "xclub_id"
    t.string   "title"
    t.text     "content"
    t.text     "summary"
    t.string   "location"
    t.datetime "time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover"
  end

  create_table "xmembers", force: true do |t|
    t.integer  "xclub_id"
    t.integer  "user_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
