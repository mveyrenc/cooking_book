class DishType < ActiveRecord::Base
  validates :name, presence: true
  
  def to_s
    name
  end
end
