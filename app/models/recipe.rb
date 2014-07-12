class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  validates :dish_type_id, presence: true
  
  belongs_to :dish_type
  has_and_belongs_to_many :categories
  
  after_save :index_in_solr
  
  searchable do
    text :name
    text :source
    text :wine
    text :ingredients, :description, :directions do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
    integer :dish_type_id, :references => DishType
    integer :category_ids, :multiple => true, :references => Category
    string :source
  end
  
  def index_in_solr
    begin
      Recipe.reindex
      Sunspot.commit
    rescue Errno::ECONNREFUSED, Timeout::Error => e
      logger.error e.message
    end
  end
  
  def to_s
    name
  end
end
