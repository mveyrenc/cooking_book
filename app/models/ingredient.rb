class Ingredient < ActiveRecord::Base
  extend FriendlyId
  friendly_id :id_and_name, use: :slugged
  
  has_ancestry
  
  validates :name, presence: true, :uniqueness => true 
  
  has_and_belongs_to_many :recipes, :counter_cache => true

  default_scope { order('name') } 
  
  scope :ordered, ->{ order(name: :asc) }
  
  before_save :update_counters
  
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
  
  private
  def update_counters
    Ingredient.update_counters id, :recipes_count => recipes.length
  end
  
end
