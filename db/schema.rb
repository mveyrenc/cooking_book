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

ActiveRecord::Schema.define(version: 20160714142530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "average_caches", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                                null: false
    t.string   "role"
    t.index ["email"], :name => "index_users_on_email", :unique => true
    t.index ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "slug"
    t.boolean  "is_course_type", default: false, null: false
    t.integer  "author_id"
    t.integer  "modifier_id"
    t.index ["author_id"], :name => "fk__categories_author_id"
    t.index ["modifier_id"], :name => "fk__categories_modifier_id"
    t.index ["name"], :name => "index_categories_on_name", :unique => true
    t.index ["slug"], :name => "index_categories_on_slug", :unique => true
    t.foreign_key ["author_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_categories_author_id"
    t.foreign_key ["modifier_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_categories_modifier_id"
  end

  create_table "categories_recipes", id: false, force: true do |t|
    t.integer "recipe_id",   null: false
    t.integer "category_id", null: false
  end

  create_table "categories_related", id: false, force: true do |t|
    t.integer "category_id",         null: false
    t.integer "related_category_id", null: false
  end

  create_table "categories_suggested", id: false, force: true do |t|
    t.integer "category_id",           null: false
    t.integer "suggested_category_id", null: false
  end

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], :name => "delayed_jobs_priority"
  end

  create_table "dish_types", force: true do |t|
    t.string   "name"
    t.string   "plurial_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "position"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", :unique => true
    t.index ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "best_months",   default: [], array: true
    t.text     "worse_months",  default: [], array: true
    t.integer  "recipes_count", default: 0
    t.integer  "author_id"
    t.integer  "modifier_id"
    t.index ["ancestry"], :name => "index_ingredients_on_ancestry"
    t.index ["author_id"], :name => "fk__ingredients_author_id"
    t.index ["modifier_id"], :name => "fk__ingredients_modifier_id"
    t.index ["slug"], :name => "index_ingredients_on_slug", :unique => true
    t.foreign_key ["author_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_ingredients_author_id"
    t.foreign_key ["modifier_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_ingredients_modifier_id"
  end

  create_table "ingredients_recipes", id: false, force: true do |t|
    t.integer "ingredient_id", null: false
    t.integer "recipe_id",     null: false
  end

  create_table "overall_averages", force: true do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rates", force: true do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["rateable_id", "rateable_type"], :name => "index_rates_on_rateable_id_and_rateable_type"
    t.index ["rater_id"], :name => "index_rates_on_rater_id"
  end

  create_table "rating_caches", force: true do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["cacheable_id", "cacheable_type"], :name => "index_rating_caches_on_cacheable_id_and_cacheable_type"
  end

  create_table "recipes", force: true do |t|
    t.string   "name",                 null: false
    t.text     "ingredients",          null: false
    t.text     "directions",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quantity"
    t.text     "description"
    t.text     "times"
    t.string   "wine"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.text     "slug"
    t.integer  "author_id"
    t.integer  "modifier_id"
    t.index ["author_id"], :name => "fk__recipes_author_id"
    t.index ["modifier_id"], :name => "fk__recipes_modifier_id"
    t.index ["slug"], :name => "index_recipes_on_slug", :unique => true
    t.foreign_key ["author_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_recipes_author_id"
    t.foreign_key ["modifier_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_recipes_modifier_id"
  end

  create_table "recipes_sources", id: false, force: true do |t|
    t.integer "recipe_id", null: false
    t.integer "source_id", null: false
  end

  create_table "sources", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id"
    t.integer  "modifier_id"
    t.index ["ancestry"], :name => "index_sources_on_ancestry"
    t.index ["author_id"], :name => "fk__sources_author_id"
    t.index ["modifier_id"], :name => "fk__sources_modifier_id"
    t.index ["slug"], :name => "index_sources_on_slug", :unique => true
    t.foreign_key ["author_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_sources_author_id"
    t.foreign_key ["modifier_id"], "users", ["id"], :on_update => :no_action, :on_delete => :no_action, :name => "fk_sources_modifier_id"
  end

end
