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

ActiveRecord::Schema.define(version: 2020_03_13_041447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "photo", null: false
    t.string "title", null: false
    t.text "content"
    t.integer "status", limit: 2, default: 0, null: false, comment: "draft, published, inactive"
    t.string "slug"
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category", default: 0
    t.date "published_date"
  end

  create_table "banners", force: :cascade do |t|
    t.integer "site_setting_id"
    t.string "title"
    t.integer "status", limit: 2, default: 1, null: false
    t.string "link"
    t.string "alt"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "slug"
    t.integer "status", limit: 2, default: 1, null: false
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dogs", force: :cascade do |t|
    t.integer "father_id"
    t.integer "mother_id"
    t.string "name", null: false
    t.integer "sex", limit: 2, default: 0, null: false
    t.integer "color_type", limit: 2
    t.string "living_address"
    t.text "description"
    t.string "slug"
    t.date "date_of_birth"
    t.date "date_of_death"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "microchip_number"
    t.string "owner"
    t.integer "pack_id"
  end

  create_table "packs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "display_order", limit: 2, default: 0
    t.integer "status", limit: 2, default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "dog_id"
    t.string "title"
    t.string "alt"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_id"
    t.index ["dog_id"], name: "index_photos_on_dog_id"
    t.index ["sale_id"], name: "index_photos_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sale_price"
    t.bigint "dog_id"
    t.integer "status", limit: 2, default: 1
    t.index ["dog_id"], name: "index_sales_on_dog_id"
  end

  create_table "services", force: :cascade do |t|
    t.integer "site_setting_id"
    t.string "title", null: false
    t.text "content"
    t.integer "status", limit: 2, default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.integer "display_order", limit: 2, default: 1
  end

  create_table "site_settings", force: :cascade do |t|
    t.integer "status", limit: 2, default: 1, null: false
    t.integer "setting_type", limit: 2, null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tinymce_images", force: :cascade do |t|
    t.string "alt", default: ""
    t.string "hint", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
  end

  add_foreign_key "photos", "sales"
end
