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

ActiveRecord::Schema.define(version: 2021_09_03_062916) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "average_caches", id: :serial, force: :cascade do |t|
    t.integer "rater_id"
    t.integer "rateable_id"
    t.string "rateable_type", limit: 255
    t.float "avg", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "slug"
    t.boolean "is_course_type", default: false, null: false
    t.integer "author_id"
    t.integer "modifier_id"
    t.string "book"
    t.string "categorization"
    t.index ["author_id"], name: "fk__categories_author_id"
    t.index ["book"], name: "index_categories_on_book"
    t.index ["categorization"], name: "index_categories_on_categorization"
    t.index ["modifier_id"], name: "fk__categories_modifier_id"
    t.index ["name", "book", "categorization"], name: "index_categories_on_name_and_book_and_categorization", unique: true
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "categories_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "category_id", null: false
  end

  create_table "categories_related", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "related_category_id", null: false
  end

  create_table "categories_related_tree", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "related_category_id", null: false
  end

  create_table "categories_suggested", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "suggested_category_id", null: false
  end

  create_table "content_blocks", force: :cascade do |t|
    t.bigint "content_id"
    t.string "ancestry"
    t.integer "content_block_type"
    t.integer "position"
    t.text "original_text"
    t.text "content_text"
    t.jsonb "data_struct"
    t.jsonb "metadataoriginal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry"], name: "index_content_blocks_on_ancestry"
    t.index ["content_id"], name: "index_content_blocks_on_content_id"
  end

  create_table "contents", force: :cascade do |t|
    t.string "title"
    t.bigint "book_id"
    t.integer "content_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_contents_on_book_id"
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0, null: false
    t.integer "attempts", default: 0, null: false
    t.text "handler", null: false
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by", limit: 255
    t.string "queue", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "dish_types", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "plurial_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "picture_file_name", limit: 255
    t.string "picture_content_type", limit: 255
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer "position"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", limit: 255, null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope", limit: 255
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "overall_averages", id: :serial, force: :cascade do |t|
    t.integer "rateable_id"
    t.string "rateable_type", limit: 255
    t.float "overall_avg", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", id: :serial, force: :cascade do |t|
    t.integer "rater_id"
    t.integer "rateable_id"
    t.string "rateable_type", limit: 255
    t.float "stars", null: false
    t.string "dimension", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rater_id"], name: "index_rates_on_rater_id"
  end

  create_table "rating_caches", id: :serial, force: :cascade do |t|
    t.integer "cacheable_id"
    t.string "cacheable_type", limit: 255
    t.float "avg", null: false
    t.integer "qty", null: false
    t.string "dimension", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type"
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "ingredients"
    t.text "directions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "quantity", limit: 255
    t.text "description"
    t.text "times"
    t.string "wine", limit: 255
    t.string "picture_file_name", limit: 255
    t.string "picture_content_type", limit: 255
    t.integer "picture_file_size"
    t.datetime "picture_updated_at"
    t.text "slug"
    t.integer "author_id"
    t.integer "modifier_id"
    t.string "book", null: false
    t.index ["author_id"], name: "fk__recipes_author_id"
    t.index ["book"], name: "index_recipes_on_book"
    t.index ["modifier_id"], name: "fk__recipes_modifier_id"
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "name", limit: 255, null: false
    t.string "role", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "users", column: "author_id", name: "fk_categories_author_id"
  add_foreign_key "categories", "users", column: "modifier_id", name: "fk_categories_modifier_id"
  add_foreign_key "recipes", "users", column: "author_id", name: "fk_recipes_author_id"
  add_foreign_key "recipes", "users", column: "modifier_id", name: "fk_recipes_modifier_id"
end
