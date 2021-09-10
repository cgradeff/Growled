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

ActiveRecord::Schema.define(version: 2021_09_10_194624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "colors", force: :cascade do |t|
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["color"], name: "index_colors_on_color"
  end

  create_table "joins", force: :cascade do |t|
    t.bigint "listings_id", null: false
    t.bigint "types_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["listings_id"], name: "index_joins_on_listings_id"
    t.index ["types_id"], name: "index_joins_on_types_id"
  end

  create_table "joins_cs", force: :cascade do |t|
    t.bigint "listings_id", null: false
    t.bigint "colors_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["colors_id"], name: "index_joins_cs_on_colors_id"
    t.index ["listings_id"], name: "index_joins_cs_on_listings_id"
  end

  create_table "listings", force: :cascade do |t|
    t.integer "author_id", null: false
    t.string "title", null: false
    t.string "body", null: false
    t.integer "price", null: false
    t.boolean "offer", null: false
    t.boolean "sold", null: false
    t.string "condition", null: false
    t.string "rarity", null: false
    t.integer "mana", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["condition"], name: "index_listings_on_condition"
    t.index ["mana"], name: "index_listings_on_mana"
    t.index ["price"], name: "index_listings_on_price"
    t.index ["rarity"], name: "index_listings_on_rarity"
    t.index ["sold"], name: "index_listings_on_sold"
    t.index ["title"], name: "index_listings_on_title"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_types_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "bio"
    t.string "password_digest"
    t.string "session_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "joins", "listings", column: "listings_id"
  add_foreign_key "joins", "types", column: "types_id"
  add_foreign_key "joins_cs", "colors", column: "colors_id"
  add_foreign_key "joins_cs", "listings", column: "listings_id"
end
