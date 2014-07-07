class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  validates :dish_type_id, presence: true
  
  belongs_to :dish_type
  has_and_belongs_to_many :categories
  
  after_save :index_in_solr
  
  searchable do
    text :name, :source
    text :ingredients, :stored => true do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
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
