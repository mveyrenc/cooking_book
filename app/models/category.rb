class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :id_and_name, use: :slugged
  
  validates :name, presence: true, :uniqueness => true 
  
  has_and_belongs_to_many :recipes
  
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
  
  scope :ordered, ->{ order(name: :asc) }
  scope :course_type, -> { where(is_course_type: true) }
  scope :categories, -> { where(is_course_type: false) }
  
  def related_categories_for_recipes
    related_categories_for_recipes = [self]
    related_categories.each do |category|
      related_categories_for_recipes |= category.related_categories_for_recipes
    end
    related_categories_for_recipes
  end
  
  def suggested_categories_for_recipes
    suggested_categories_for_recipes = []
    parsed_categories = [self]
    suggested_categories.each do |category|
      if( !parsed_categories.include?(category)) 
        suggested_categories_for_recipes |= [category]
        suggested_categories_for_recipes |= category.suggested_categories_for_recipes
        parsed_categories << category
      end
    end
    categories = related_categories_for_recipes
    categories.each do |category|
      if( !parsed_categories.include?(category)) 
        suggested_categories_for_recipes |= category.suggested_categories
        parsed_categories << category
      end
    end
    suggested_categories_for_recipes - related_categories_for_recipes - [self]
  end
  
  def id_and_name
    "#{id} #{name}"
  end
  
  def should_generate_new_friendly_id?
    true
  end
  
  def to_s
    name
  end
  
  def to_i
    id
  end
end
