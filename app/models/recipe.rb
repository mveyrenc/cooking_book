class Recipe < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "240", :thumb => "100", :medium_gray => "240", :thumb_gray => "100" }, :convert_options => { :thumb_gray => '-colorspace Gray', :medium_gray => '-colorspace Gray' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  
  validates :name, presence: true
  validates :ingredients, presence: true
  validates :directions, presence: true
  validates :dish_type_id, presence: true
  
  belongs_to :dish_type
  has_and_belongs_to_many :categories
  
  ratyrate_rateable "note", "difficulty", "cost"
  
  after_save :index_in_solr
  
  searchable do
    text :name
    text :source
    text :wine
    text :ingredients do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
    text :description do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
    text :directions do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
    time :created_at
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
