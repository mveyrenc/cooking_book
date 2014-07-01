class Recipe < ActiveRecord::Base
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  
  after_save :index_in_solr
  
  searchable do
    text :name, :source
    text :ingredients, :stored => true do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
  end
  
  def index_in_solr
    Recipe.reindex
    Sunspot.commit
  end
  
  def to_s
    name
  end
end
