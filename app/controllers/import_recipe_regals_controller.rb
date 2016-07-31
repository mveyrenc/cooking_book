class ImportRecipeRegalsController < ApplicationController
  
  require 'nokogiri'
  require 'open-uri'

  DIFFICULTY_LEVEL_1 = 'Très facile'
  DIFFICULTY_LEVEL_2 = 'Facile'
  DIFFICULTY_LEVEL_3 = 'Not defined'
  DIFFICULTY_LEVEL_4 = 'Confirmé'
  DIFFICULTY_LEVEL_5 = 'Expert'

  COST_LEVEL_1 = 'Bon marché'
  COST_LEVEL_2 = 'Not defined'
  COST_LEVEL_3 = 'Abordable'
  COST_LEVEL_4 = 'Not defined'
  COST_LEVEL_5 = 'Assez cher'
  
  def new
    authorize! :create, Recipe
    @import_recipe = ImportRecipeRegal.new
    @import_recipe.url
  end
  
  def create
    authorize! :create, Recipe
    @import_recipe = ImportRecipeRegal.new(import_recipe_regal_params)
      
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

  def import_recipe_regal_params
    params.require(:import_recipe_regal).permit(:url)
  end
  
  def sniffe
    @recipe = Recipe.new
    @recipe.author = current_user
    @recipe.modifier = current_user
    
    response = open(@import_recipe.url) rescue nil
    doc = Nokogiri::HTML(response)
    
    @recipe.name = doc.css('h1.node-title').first.text.strip
    
    difficulty_level = doc.css('.field-name-field-difficulty-level .field-items').first.text.strip
    case difficulty_level
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
    
    cost_level = doc.css('.field-name-field-price-level .field-items').first.text.strip
    case cost_level
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
    
    times = Array.new
    preptime = doc.css('.field-name-field-recipe-preptime .field-items').first
    if !preptime.nil?
      times << ('Préparation : ' << preptime.text.strip)
    end
    cooktime = doc.css('.field-name-field-recipe-cooktime .field-items').first
    if !cooktime.nil?
      times << ('Cuisson : ' << cooktime.text.strip)
    end
    resttime = doc.css('.field-name-field-recipe-resttime .field-items').first
    if !resttime.nil?
      times << ('Repos : ' << resttime.text.strip)
    end
    @recipe.times = times.join("\n")
    
    doc.css('.field-name-categories a').each do |category|
      category_name = category.text.strip
      recipe_category = Category.where("lower(name) LIKE ?", category_name.downcase.chomp('s').downcase << '%').first 
      if !recipe_category.nil?
        @recipe.categories << recipe_category
      end
    end
    
    recipe_img = doc.css('.field-name-field-images img.adv-slide').first
    if !recipe_img.nil?
      recipe_img_url = recipe_img.attr('src')
      begin
        response = URI.parse(recipe_img_url)
        @recipe.picture = response if response
      rescue
      end
    end
  
    quatity = doc.css('.field-name-field-recipe-yield h2').first
    if !quatity.nil?
      @recipe.quantity = quatity.text.strip
    end
  
    ingredients = doc.css('.field-name-field-recipe-elements .entity-field-collection-item')
    if !ingredients.nil?
      @recipe.ingredients = '<ul>'
      ingredients.each do |ingredient|
#        @recipe.ingredients << '<li>' << ingredient.text.each_line.map{|r| r.strip.downcase}.reject{|x| x.strip == ""}.join(' ') << '</li>'
        @recipe.ingredients << '<li>' << ingredient.text.downcase.gsub('oe', 'œ') << '</li>'
      end
      @recipe.ingredients << '</ul>'
    end
  
    @recipe.directions = doc.css('.field-name-field-recipe-steps p').to_s.gsub('oe', 'œ')
    @recipe.directions << doc.css('.field-name-body p').to_s.gsub('oe', 'œ')
    
    doc.css('.field-name-field-tags a').each do |tag|
      tag_name = tag.text.strip.chomp('s').downcase
      
      recipe_category = Category.where("lower(name) LIKE ?", tag_name << '%').ordered
      if recipe_category.count == 1
        @recipe.categories << recipe_category[0]
      end
      
      recipe_ingredient = Ingredient.where("lower(name) LIKE ?", tag_name << '%').ordered
      if recipe_ingredient.count == 1 and !recipe_ingredient[0].is_root?
        @recipe.main_ingredients << recipe_ingredient[0]
      end
      
      recipe_source = Source.where("lower(name) LIKE ?", tag_name << '%').ordered
      if recipe_source.count == 1
        @recipe.sources << recipe_source[0]
      end
      
    end
      
    recipe_source = Source.where("lower(name) LIKE ?", 'régal').ordered.first
    if !recipe_source.nil?
      @recipe.sources << recipe_source
    end
    
    @recipe.save
  end

end
