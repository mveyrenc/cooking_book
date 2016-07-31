class ImportRecipeElleatablesController < ApplicationController
  
  require 'nokogiri'
  require 'open-uri'

  DIFFICULTY_LEVEL_1 = 'Trés facile'
  DIFFICULTY_LEVEL_2 = 'Facile'
  DIFFICULTY_LEVEL_3 = 'Nor defined'
  DIFFICULTY_LEVEL_4 = 'Assez difficile'
  DIFFICULTY_LEVEL_5 = 'Difficile'

  COST_LEVEL_1 = 'Bon marché'
  COST_LEVEL_2 = 'Not defined'
  COST_LEVEL_3 = 'Abordable'
  COST_LEVEL_4 = 'Not defined'
  COST_LEVEL_5 = 'Assez cher'
  
  def new
    authorize! :create, Recipe
    @import_recipe = ImportRecipeElleatable.new
    @import_recipe.url
  end
  
  def create
    authorize! :create, Recipe
    @import_recipe = ImportRecipeElleatable.new(import_recipe_elleatable_params)
      
    respond_to do |format|
      if @import_recipe.valid?
        sniffe
        format.html { render template: "recipes/new" }
      else
        format.html { render :new }
      end
    end
  end
  
  private

  def import_recipe_elleatable_params
    params.require(:import_recipe_elleatable).permit(:url)
  end
  
  def sniffe
    @recipe = Recipe.new
    @recipe.author = current_user
    @recipe.modifier = current_user
    
    response = open(@import_recipe.url) rescue nil
    doc = Nokogiri::HTML(response)
    
    @recipe.name = doc.css('h1').first.text
    
    doc.css('.details-produits li').each do |product_detail|
      case product_detail.text.strip
      when DIFFICULTY_LEVEL_1
        @recipe.difficulty = 1
      when DIFFICULTY_LEVEL_2
        @recipe.difficulty = 2
      when DIFFICULTY_LEVEL_3
        @recipe.difficulty = 3
      when DIFFICULTY_LEVEL_4
        @recipe.difficulty = 4
      when DIFFICULTY_LEVEL_5
        @recipe.difficulty = 5
      end
    
      case product_detail.text.strip
      when COST_LEVEL_1
        @recipe.cost = 1
      when COST_LEVEL_2
        @recipe.cost = 2
      when COST_LEVEL_3
        @recipe.cost = 3
      when COST_LEVEL_4
        @recipe.cost = 4
      when COST_LEVEL_5
        @recipe.cost = 5
      end
    end
   
    times = Array.new
    preptime = doc.css('span[itemprop=prepTime]').first
    if !preptime.nil?
      times << ('Préparation : ' << preptime.text.strip << ' min')
    end
    cooktime = doc.css('span[itemprop=cookTime]').first
    if !cooktime.nil?
      times << ('Cuisson : ' << cooktime.text.strip << ' min')
    end
    resttime = doc.css('span[itemprop=restTime]').first
    if !resttime.nil?
      times << ('Repos : ' << resttime.text.strip << ' min')
    end
    @recipe.times = times.join("\n")
    
    doc.css('li.keywords a').each do |category|
      category_name = category.text.strip
      recipe_category = Category.where("lower(name) LIKE ?", category_name.chomp('s').downcase << '%').first 
      if !recipe_category.nil?
        @recipe.categories << recipe_category
      end
    end
    
    recipe_img = doc.css('img[itemprop=image]').first
    if !recipe_img.nil?
      recipe_img_url = recipe_img['src']
      begin
        response = URI.parse(recipe_img_url)
        @recipe.picture = response if response
      rescue
      end
    end
  
    quatity = doc.css('span[itemprop=recipeYield]').first
    if !quatity.nil?
      @recipe.quantity = 'Pour ' << quatity.parent.text.strip
    end
  
    ingredients_text = ''
    doc.css('li[itemprop=recipeIngredient]').each do |ingredient|
      ingredients_text << '<li>' << ingredient.text.strip << '</li>'
    end
    @recipe.ingredients = '<ul>' << ingredients_text.gsub('oe', 'œ') << '</ul>'
  
    @recipe.directions = doc.css('li[itemprop=recipeInstructions] p').to_s.gsub('oe', 'œ')
    
    astuce = doc.css('.astuce p')
    if !astuce.empty?
      @recipe.directions << '<p><b>Astuces</b></p>' << astuce.to_s
    end
  
    author = doc.css('span[itemprop=author]').first
    if !author.nil?
      recipe_source = Source.where("lower(name) LIKE ?", author.text.strip).ordered.first
      if !recipe_source.nil?
        @recipe.sources << recipe_source
      end
    end
      
    recipe_source = Source.where("lower(name) LIKE ?", 'elle à table').ordered.first
    if !recipe_source.nil?
      @recipe.sources << recipe_source
    end
    
    @recipe.save
  end

end
