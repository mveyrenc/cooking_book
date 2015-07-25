class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
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
  
  def to_s
    name
  end
  
  def should_generate_new_friendly_id?
    new_record? || slug.blank?
  end
end
