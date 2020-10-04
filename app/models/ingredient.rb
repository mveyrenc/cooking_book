class Ingredient < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  has_ancestry
  
  has_and_belongs_to_many :recipes, :counter_cache => true
  belongs_to :author, class_name: "User"
  belongs_to :modifier, class_name: "User"
  
  validates :name, presence: true, :uniqueness => true
  validates :author, presence: true
  validates :modifier, presence: true

  default_scope { order('name') } 
  
  scope :ordered, ->{ order(name: :asc) }
  
  before_save :update_counters

  def book
    Book::COOKING
  end

  def months
    months = {}
    empty_count = 0
    (1..12).each do |m|
      if best_months.include?( m.to_s )
        months[m] = 'b'
      elsif worse_months.include?( m.to_s )
        months[m] = 'w'
      else
        months[m] = ''
        empty_count += 1
      end
    end
    if empty_count == 12
      months = false
    end
    months
  end
  
  def to_s
    name
  end
   
  def to_i
    id
  end
  
  private
  def update_counters
    self.recipes_count = recipes.length
  end
  
end
