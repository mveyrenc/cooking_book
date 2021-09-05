class Category < ApplicationRecord
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

  enum book: Book.to_hash, _suffix: true
  enum categorization: Categorization.to_hash, _suffix: true

  belongs_to :author, class_name: "User"
  belongs_to :modifier, class_name: "User"

  validates :name, presence: true, uniqueness: { scope: [:book, :categorization], case_sensitive: false }
  validates :book, presence: true
  validates :categorization, presence: true
  validates :author, presence: true
  validates :modifier, presence: true

  scope :ordered, -> { order(name: :asc) }

  searchkick default_fields: ["name^10"]

  after_commit :reindex_recipes

  def search_data
    attributes.merge(
      book_name: Category.human_enum_name(:book, book),
      categorization_name: Category.human_enum_name(:categorization, categorization),

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
    if @extra_related_categories.nil?
      build_extra_related_categories(self)
    end
    @extra_related_categories
  end

  def to_s
    name
  end

  def to_i
    id
  end

  def self.i18n_books
    self.books.transform_values { |v| self.human_enum_name :book, v }.sort_by {|k, v| v}
  end

  def self.i18n_categorizations
    self.categorizations.transform_values { |v| self.human_enum_name :categorization, v }.sort_by {|k, v| v}
  end

  private

  attr :parsed_c

  def build_extra_related_categories(c)
    @extra_related_categories = [] if @extra_related_categories.nil?
    @parsed_c = [] if @parsed_c.nil?
    unless @parsed_c.include?(c.id)
      add_extra_related_categories(c)
      if c == self
        @parsed_c << c.id
      end
      c.related_tree_categories.each do |r|
        add_extra_related_categories(r)
        build_extra_related_categories(r)
        @parsed_c << r.id
      end
      c.related_categories.each do |r|
        add_extra_related_categories(r)
      end
    end
    @extra_related_categories
  end

  def add_extra_related_categories(c)
    unless c == self or @extra_related_categories.include?(c) or related_categories.include?(c) or related_tree_categories.include?(c)
      @extra_related_categories << c
    end
  end
end
