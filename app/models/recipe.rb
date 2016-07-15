class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :id_and_name, use: :slugged
  
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :sources
  has_and_belongs_to_many(:main_ingredients,
    :class_name => "Ingredient"
  )
  belongs_to :author, class_name: "User"
  belongs_to :modifier, class_name: "User"
  
  validates :name, presence: true
  validates :directions, presence: true
  validates :author, presence: true
  validates :modifier, presence: true
  
  has_attached_file :picture, :styles => { :medium => "240", :thumb => "100", :medium_gray => "240", :thumb_gray => "100" }, :convert_options => { :thumb_gray => '-colorspace Gray', :medium_gray => '-colorspace Gray' }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  
  ratyrate_rateable "note", "difficulty", "cost"
  
  before_save :update_counters
  
  searchable do
    text :name
    text :wine
    text :ingredients do
      HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
    end
    text :description do
      HTMLEntities.new.decode( Sanitize.clean( description ) )
    end
    text :directions do
      HTMLEntities.new.decode( Sanitize.clean( directions ) )
    end
    time :created_at
    integer :course_type_ids, :multiple => true, :references => Category do
      (additional_categories | categories).select{ |c| c.is_course_type }
    end
    integer :category_ids, :multiple => true, :references => Category do
      (additional_categories | categories).reject{ |c| c.is_course_type }
    end
    integer :main_ingredient_ids, :multiple => true, :references => Ingredient do
      additional_main_ingredients | main_ingredients
    end
    integer :source_ids, :multiple => true, :references => Source do
      sources_list
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
  
  def additional_categories
    additional_categories = []
    categories.each do |category|
      additional_categories |= category.related_categories_for_recipes
    end
    additional_categories - categories
  end
  
  def additional_main_ingredients
    additional_ingredients = []
    main_ingredients.each do |ingredient|
      additional_ingredients |= ingredient.ancestors
    end
    additional_ingredients - main_ingredients
  end
  
  def sources_list
    sources_list = []
    sources.each do |source|
      sources_list |= source.path
    end
    sources_list.uniq
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
    for i in main_ingredients do
      i.save
    end
  end
end
