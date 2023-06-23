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

ActiveRecord::Schema[7.0].define(version: 2023_06_15_084957) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.boolean "draft", default: true
    t.string "batch_number"
    t.bigint "user_id", null: false
    t.bigint "article_category_id", null: false
    t.bigint "resource_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_category_id"], name: "index_articles_on_article_category_id"
    t.index ["resource_id"], name: "index_articles_on_resource_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.text "body"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "groupes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_locations", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resources", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "resource_category_id", null: false
    t.bigint "resource_location_id", null: false
    t.bigint "reference_person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reference_person_id"], name: "index_resources_on_reference_person_id"
    t.index ["resource_category_id"], name: "index_resources_on_resource_category_id"
    t.index ["resource_location_id"], name: "index_resources_on_resource_location_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "email"
    t.bigint "groupe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["groupe_id"], name: "index_users_on_groupe_id"
  end

  add_foreign_key "articles", "article_categories"
  add_foreign_key "articles", "resources"
  add_foreign_key "articles", "users"
  add_foreign_key "comments", "articles"
  add_foreign_key "comments", "users"
  add_foreign_key "resources", "resource_categories"
  add_foreign_key "resources", "resource_locations"
  add_foreign_key "resources", "users", column: "reference_person_id"
  add_foreign_key "users", "groupes"
end
