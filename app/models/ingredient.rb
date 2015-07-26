class Ingredient < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_ancestry
  
  validates :name, presence: true, :uniqueness => true 
  
  scope :ordered, ->{ order(name: :asc) }
  
  def to_s
    name
  end
  
  def to_i
    id
  end
end
