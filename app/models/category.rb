class Category < ActiveRecord::Base
  validates :name, presence: true, :uniqueness => true 
  
  has_and_belongs_to_many :recipes
  
  has_and_belongs_to_many(:related_categories,
    :join_table => "categories_related",
    :foreign_key => "category_id",
    :association_foreign_key => "related_category_id")
  
  has_and_belongs_to_many(:suggested_categories,
    :join_table => "categories_suggested",
    :foreign_key => "category_id",
    :association_foreign_key => "suggested_category_id")
  
  def to_s
    name
  end
end
