class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_and_belongs_to_many :recipes

  has_and_belongs_to_many(:related_tree_categories,
                          :class_name => "Category",
                          :join_table => "categories_related_tree",
                          :foreign_key => "category_id",
                          :association_foreign_key => "related_category_id")

  has_and_belongs_to_many(:related_tree_by_categories,
                          :class_name => "Category",
                          :join_table => "categories_related_tree",
                          :foreign_key => "related_category_id",
                          :association_foreign_key => "category_id")

  has_and_belongs_to_many(:related_categories,
                          :class_name => "Category",
                          :join_table => "categories_related",
                          :foreign_key => "category_id",
                          :association_foreign_key => "related_category_id")

  has_and_belongs_to_many(:related_by_categories,
                          :class_name => "Category",
                          :join_table => "categories_related",
                          :foreign_key => "related_category_id",
                          :association_foreign_key => "category_id")

  has_and_belongs_to_many(:suggested_categories,
                          :class_name => "Category",
                          :join_table => "categories_suggested",
                          :foreign_key => "category_id",
                          :association_foreign_key => "suggested_category_id")

  has_and_belongs_to_many(:suggested_by_categories,
                          :class_name => "Category",
                          :join_table => "categories_suggested",
                          :foreign_key => "suggested_category_id",
                          :association_foreign_key => "category_id")

  belongs_to :categorization

  belongs_to :author, class_name: "User"
  belongs_to :modifier, class_name: "User"

  validates :name, presence: true, uniqueness: { scope: :categorization, case_sensitive: false }
  validates :author, presence: true
  validates :modifier, presence: true

  scope :ordered, -> { order(name: :asc) }

  searchkick default_fields: ["name^10"]

  after_commit :reindex_recipes

  def search_data
    attributes.merge(
      categorization_name: categorization.to_s,

      book_id: categorization.book.id,
      book_name: categorization.book.to_s,

      related_tree_categories_names: related_tree_categories.map(&:name),
      related_tree_categories_ids: related_tree_categories.map(&:id),

      related_tree_by_categories_names: related_tree_by_categories.map(&:name),
      related_tree_by_categories_ids: related_tree_by_categories.map(&:id),

      related_categories_names: related_categories.map(&:name),
      related_categories_ids: related_categories.map(&:id),

      related_by_categories_names: related_by_categories.map(&:name),
      related_by_categories_ids: related_by_categories.map(&:id),

      suggested_categories_names: suggested_categories.map(&:name),
      suggested_categories_ids: suggested_categories.map(&:id),

      suggested_by_categories_names: suggested_by_categories.map(&:name),
      suggested_by_categories_ids: suggested_by_categories.map(&:id),
    )
  end

  def reindex_recipes
    recipes.each do |r|
      r.reindex
    end
  end

  def extra_related_categories
    categories = [self]
    related_tree_categories.each do |category|
      unless categories.include?(category)
        categories |= category.related_categories_for_recipes
      end
    end
    categories - related_tree_categories - [self]
  end

  def related_categories_for_recipes
    related_tree_categories + related_categories + extra_related_categories - [self]
  end

  def suggested_categories_for_recipes
    categories = []
    parsed_categories = [self]
    related_categories = related_categories_for_recipes
    suggested_categories.each do |category|
      if (!parsed_categories.include?(category))
        categories |= [category]
        categories |= category.categories
        parsed_categories << category
      end
    end
    categories.each do |category|
      if (!parsed_categories.include?(category))
        categories |= category.suggested_categories
        parsed_categories << category
      end
    end
    categories - related_categories - [self]
  end

  def to_s
    name
  end

  def to_i
    id
  end
end
