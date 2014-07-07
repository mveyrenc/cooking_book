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

ActiveRecord::Schema.define(version: 20140707194651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_recipes", id: false, force: true do |t|
    t.integer "recipe_id",   null: false
    t.integer "category_id", null: false
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
  end

  create_table "recipes", force: true do |t|
    t.string   "name",         null: false
    t.text     "ingredients",  null: false
    t.text     "directions",   null: false
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "quantity"
    t.text     "description"
    t.text     "times"
    t.string   "wine"
    t.integer  "dish_type_id"
  end

end
