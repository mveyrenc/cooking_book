class DishType < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :recipes
  
  def to_s
    name
  end
end
