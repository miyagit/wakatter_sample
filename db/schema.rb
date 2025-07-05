# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_07_05_083954) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followed_id"], name: "index_follows_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_follows_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_follows_on_follower_id"
  end

  create_table "group_members", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id", null: false
    t.string "role", default: "member", null: false
    t.string "status", default: "pending", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "user_id"], name: "index_group_members_on_group_id_and_user_id", unique: true
    t.index ["group_id"], name: "index_group_members_on_group_id"
    t.index ["user_id"], name: "index_group_members_on_user_id"
  end

  create_table "group_posts", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id", "post_id"], name: "index_group_posts_on_group_id_and_post_id", unique: true
    t.index ["group_id"], name: "index_group_posts_on_group_id"
    t.index ["post_id"], name: "index_group_posts_on_post_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_groups_on_creator_id"
  end

  create_table "post_comments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_comments_on_post_id"
    t.index ["user_id"], name: "index_post_comments_on_user_id"
  end

  create_table "post_likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_likes_on_post_id"
    t.index ["user_id"], name: "index_post_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.string "image"
    t.integer "user_id"
    t.integer "likes_count"
    t.index ["category_id"], name: "index_posts_on_category_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.string "username"
    t.string "job"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.text "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "follows", "users", column: "followed_id"
  add_foreign_key "follows", "users", column: "follower_id"
  add_foreign_key "group_members", "groups"
  add_foreign_key "group_members", "users"
  add_foreign_key "group_posts", "groups"
  add_foreign_key "group_posts", "posts"
  add_foreign_key "groups", "users", column: "creator_id"
  add_foreign_key "post_comments", "posts"
  add_foreign_key "post_comments", "users"
  add_foreign_key "post_likes", "posts"
  add_foreign_key "post_likes", "users"
end
