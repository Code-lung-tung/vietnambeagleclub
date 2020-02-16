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

ActiveRecord::Schema.define(version: 2020_02_15_160411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.bigint "category_id"
    t.string "photo", null: false
    t.string "title", null: false
    t.text "content"
    t.integer "status", limit: 2, default: 0, null: false, comment: "draft, published, inactive"
    t.string "meta_title"
    t.string "meta_keywords"
    t.text "meta_description"
    t.datetime "published_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_articles_on_category_id"
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
    t.string "name"
    t.integer "sex", limit: 2, default: 0, null: false
    t.integer "color_type", limit: 2
    t.string "living_address"
    t.text "description"
    t.date "date_of_birth"
    t.date "date_of_death"
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
    t.index ["dog_id"], name: "index_photos_on_dog_id"
  end

  create_table "site_settings", force: :cascade do |t|
    t.integer "status", limit: 2, default: 1, null: false
    t.integer "type", limit: 2, null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
