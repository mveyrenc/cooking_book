class Categorization < ApplicationRecord

  COOKING_SERVING = create_with(
      name: I18n.t('categorization.item.cooking_serving.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-serving').freeze
  COOKING_THEMATIC = create_with(
      name: I18n.t('categorization.item.cooking_thematic.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-thematic').freeze
  COOKING_SEASON = create_with(
      name: I18n.t('categorization.item.cooking_season.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-season').freeze
  COOKING_OCCASION = create_with(
      name: I18n.t('categorization.item.cooking_occasion.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-occasion').freeze
  COOKING_SPECIAL_MENU = create_with(
      name: I18n.t('categorization.item.cooking_special_menu.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-special-menu').freeze
  COOKING_REGION = create_with(
      name: I18n.t('categorization.item.cooking_region.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-region').freeze
  COOKING_COOKING_METHOD = create_with(
      name: I18n.t('categorization.item.cooking_cooking_method.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-cooking-method').freeze
  COOKING_DISH_TYPE = create_with(
      name: I18n.t('categorization.item.cooking_dish_type.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-dish-type').freeze
  COOKING_MEAL = create_with(
      name: I18n.t('categorization.item.cooking_meal.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-meal').freeze
  COOKING_MAIN_INGREDIENT = create_with(
      name: I18n.t('categorization.item.cooking_main_ingredient.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-main-ingredient').freeze
  COOKING_SOURCE = create_with(
      name: I18n.t('categorization.item.cooking_source.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-source').freeze
  COOKING_CHEF = create_with(
      name: I18n.t('categorization.item.cooking_chef.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-chef').freeze
  COOKING_DIFFICULTY = create_with(
      name: I18n.t('categorization.item.cooking_difficulty.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-difficulty').freeze
  COOKING_COST = create_with(
      name: I18n.t('categorization.item.cooking_cost.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-cost').freeze
  COOKING_TODO = create_with(
      name: I18n.t('categorization.item.cooking_todo.name'),
      book_id: Book::COOKING.id
  ).find_or_create_by(slug: 'cooking-todo').freeze

  HEALTHWELLNESS_PROBLEM_TYPE = create_with(
      name: I18n.t('categorization.item.healthwellness_problem_type.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-problem-type').freeze
  HEALTHWELLNESS_SUITABLE_FOR = create_with(
      name: I18n.t('categorization.item.healthwellness_suitable_for.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-suitable-for').freeze
  HEALTHWELLNESS_BENEFIT = create_with(
      name: I18n.t('categorization.item.healthwellness_benefit.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-benefit').freeze
  HEALTHWELLNESS_SOURCE = create_with(
      name: I18n.t('categorization.item.healthwellness_source.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-source').freeze
  HEALTHWELLNESS_PRODUCT_TYPE = create_with(
      name: I18n.t('categorization.item.healthwellness_product_type.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-product-type').freeze
  HEALTHWELLNESS_DIFFICULTY = create_with(
      name: I18n.t('categorization.item.healthwellness_difficulty.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-difficulty').freeze
  HEALTHWELLNESS_COST = create_with(
      name: I18n.t('categorization.item.healthwellness_cost.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-cost').freeze
  HEALTHWELLNESS_TODO = create_with(
      name: I18n.t('categorization.item.healthwellness_todo.name'),
      book_id: Book::HEALTHWELLNESS.id
  ).find_or_create_by(slug: 'healthwellness-todo').freeze

  HOUSE_PROBLEM_TYPE = create_with(
      name: I18n.t('categorization.item.house_problem_type.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-problem-type').freeze
  HOUSE_OCCASION = create_with(
      name: I18n.t('categorization.item.house_occasion.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-occasion').freeze
  HOUSE_ROOM = create_with(
      name: I18n.t('categorization.item.house_room.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-room').freeze
  HOUSE_SOURCE = create_with(
      name: I18n.t('categorization.item.house_source.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-source').freeze
  HOUSE_PRODUCT_TYPE = create_with(
      name: I18n.t('categorization.item.house_product_type.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-product-type').freeze
  HOUSE_DIFFICULTY = create_with(
      name: I18n.t('categorization.item.house_difficulty.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-difficulty').freeze
  HOUSE_COST = create_with(
      name: I18n.t('categorization.item.house_cost.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-cost').freeze
  HOUSE_TODO = create_with(
      name: I18n.t('categorization.item.house_todo.name'),
      book_id: Book::HOUSE.id
  ).find_or_create_by(slug: 'house-todo').freeze

  belongs_to :book

  has_many :recipes

  extend FriendlyId
  friendly_id :book_name, :use => :slugged

  has_many :recipes

  def book_name
    "%s %s" % [book, name]
  end

  def to_s
    name
  end

  def to_i
    id
  end
end
