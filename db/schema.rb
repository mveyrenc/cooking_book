# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_12_182644) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
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
    t.index ["author_id"], name: "fk__categories_author_id"
    t.index ["modifier_id"], name: "fk__categories_modifier_id"
    t.index ["name"], name: "index_categories_on_name", unique: true
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

  create_table "categories_suggested", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "suggested_category_id", null: false
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

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "slug", limit: 255
    t.string "ancestry", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "best_months", default: [], array: true
    t.text "worse_months", default: [], array: true
    t.integer "recipes_count", default: 0
    t.integer "author_id"
    t.integer "modifier_id"
    t.index ["ancestry"], name: "index_ingredients_on_ancestry"
    t.index ["author_id"], name: "fk__ingredients_author_id"
    t.index ["modifier_id"], name: "fk__ingredients_modifier_id"
    t.index ["slug"], name: "index_ingredients_on_slug", unique: true
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "ingredient_id", null: false
    t.integer "recipe_id", null: false
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
    t.text "ingredients", null: false
    t.text "directions", null: false
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
    t.integer "difficulty", default: 0
    t.integer "cost", default: 0
    t.index ["author_id"], name: "fk__recipes_author_id"
    t.index ["modifier_id"], name: "fk__recipes_modifier_id"
    t.index ["slug"], name: "index_recipes_on_slug", unique: true
  end

  create_table "recipes_sources", id: false, force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "source_id", null: false
  end

  create_table "sources", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.string "slug", limit: 255
    t.string "ancestry", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "author_id"
    t.integer "modifier_id"
    t.index ["ancestry"], name: "index_sources_on_ancestry"
    t.index ["author_id"], name: "fk__sources_author_id"
    t.index ["modifier_id"], name: "fk__sources_modifier_id"
    t.index ["slug"], name: "index_sources_on_slug", unique: true
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "users", column: "author_id", name: "fk_categories_author_id"
  add_foreign_key "categories", "users", column: "modifier_id", name: "fk_categories_modifier_id"
  add_foreign_key "ingredients", "users", column: "author_id", name: "fk_ingredients_author_id"
  add_foreign_key "ingredients", "users", column: "modifier_id", name: "fk_ingredients_modifier_id"
  add_foreign_key "recipes", "users", column: "author_id", name: "fk_recipes_author_id"
  add_foreign_key "recipes", "users", column: "modifier_id", name: "fk_recipes_modifier_id"
  add_foreign_key "sources", "users", column: "author_id", name: "fk_sources_author_id"
  add_foreign_key "sources", "users", column: "modifier_id", name: "fk_sources_modifier_id"
end
