class Recipe < ActiveRecord::Base

  #  DIFFICULTIES = %w[none very_easy easy intermediate experienced expert].freeze
  #  COSTS = %w[none cheap affordable middle pretty_expensive expensive].freeze

  enum difficulty_types: [:difficulty_none, :difficulty_very_easy, :difficulty_easy, :difficulty_intermediate, :difficulty_experienced, :difficulty_expert]
  enum cost_types: [:cost_none, :cost_cheap, :cost_affordable, :cost_middle, :cost_pretty_expensive, :cost_expensive]

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :book

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :sources
  has_and_belongs_to_many(:main_ingredients,
                          :class_name => "Ingredient"
  )
  belongs_to :author, class_name: "User"
  belongs_to :modifier, class_name: "User"

  validates :book, presence: true
  validates :name, presence: true
  validates :author, presence: true
  validates :modifier, presence: true

  has_attached_file :picture,
                    :styles => {:medium => "240", :thumb => "100", :slide => "170", :medium_gray => "240", :thumb_gray => "100"},
                    :convert_options => {:thumb_gray => '-colorspace Gray', :medium_gray => '-colorspace Gray'},
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  ratyrate_rateable "note", "difficulty", "cost"

  before_save :update_counters

  searchkick
  # language: "french",
  #            fields: ["name^3", "tags^2"]

  # def search_data
  #   {
  #       ingredients: HTMLEntities.new.decode( Sanitize.clean( ingredients ) ),
  #       description: HTMLEntities.new.decode( Sanitize.clean( description ) ),
  #       directions: HTMLEntities.new.decode( Sanitize.clean( directions ) ),
  #       tags: (additional_categories | categories | additional_main_ingredients | main_ingredients | sources_list ).map{ |i| i.name }.join(' '),
  #       recipe_type_ids:  (additional_categories | categories).select{ |c| c.is_course_type },
  #       category_ids: (additional_categories | categories).reject{ |c| c.is_course_type },
  #       main_ingredient_ids: additional_main_ingredients | main_ingredients,
  #       source_ids: sources_list,
  #       difficulty: difficulty > 0 ? difficulty : nil,
  #       cost: cost > 0 ? cost : nil
  #   }
  # end

  # searchable do
  #   text :name, :boost => 3.0, :more_like_this => true
  #   text :wine
  #   text :ingredients, :more_like_this => true do
  #     HTMLEntities.new.decode( Sanitize.clean( ingredients ) )
  #   end
  #   text :description do
  #     HTMLEntities.new.decode( Sanitize.clean( description ) )
  #   end
  #   text :directions do
  #     HTMLEntities.new.decode( Sanitize.clean( directions ) )
  #   end
  #   text :tags, :more_like_this => true, :boost => 2.0 do
  #     (additional_categories | categories | additional_main_ingredients | main_ingredients | sources_list ).map{ |i| i.name }.join(' ')
  #   end
  #   time :created_at
  #   integer :course_type_ids, :multiple => true, :references => Category do
  #     (additional_categories | categories).select{ |c| c.is_course_type }
  #   end
  #   integer :category_ids, :multiple => true, :references => Category do
  #     (additional_categories | categories).reject{ |c| c.is_course_type }
  #   end
  #   integer :main_ingredient_ids, :multiple => true, :references => Ingredient do
  #     additional_main_ingredients | main_ingredients
  #   end
  #   integer :source_ids, :multiple => true, :references => Source do
  #     sources_list
  #   end
  #   integer :difficulty do
  #     difficulty > 0 ? difficulty : nil
  #   end
  #   integer :cost do
  #     cost > 0 ? cost : nil
  #   end
  # end

  # def index_in_solr
  #   begin
  #     Recipe.reindex
  #     Sunspot.commit
  #   rescue Errno::ECONNREFUSED, Timeout::Error => e
  #     logger.error e.message
  #   end
  # end

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
