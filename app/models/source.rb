class Source < ActiveRecord::Base
  extend FriendlyId
  friendly_id :id_and_name, use: :slugged
  
  has_ancestry
  
  validates :name, presence: true, :uniqueness => true 
  
  has_and_belongs_to_many :recipes

  default_scope { order('name') } 
  
  scope :ordered, ->{ order(name: :asc) }
  
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
