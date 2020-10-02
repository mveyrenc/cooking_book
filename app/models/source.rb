class Source < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_ancestry
  
  has_and_belongs_to_many :recipes
  belongs_to :author, class_name: "User"
  belongs_to :modifier, class_name: "User"
  
  validates :name, presence: true, :uniqueness => true 
  validates :author, presence: true
  validates :modifier, presence: true

  default_scope { order('name') } 
  
  scope :ordered, ->{ order(name: :asc) }
  
  def to_s
    name
  end
   
  def to_i
    id
  end
  
end
