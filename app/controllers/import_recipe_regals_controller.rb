class ImportRecipeRegalsController < ApplicationController
  
  require 'nokogiri'
  require 'open-uri'

  DIFFICULTY_LEVEL_1 = 'Très facile'
  DIFFICULTY_LEVEL_2 = 'Facile'
  DIFFICULTY_LEVEL_3 = 'Not defined'
  DIFFICULTY_LEVEL_4 = 'Not defined'
  DIFFICULTY_LEVEL_5 = 'Not defined'

  COST_LEVEL_1 = 'Bon marché'
  COST_LEVEL_2 = 'Not defined'
  COST_LEVEL_3 = 'Not defined'
  COST_LEVEL_4 = 'Not defined'
  COST_LEVEL_5 = 'Not defined'
  
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
    
    @recipe.name = doc.xpath('//h1[contains(@class, "node-title")]').text
    
    difficulty_level = doc.xpath('//*[contains(@class, "field-name-field-difficulty-level")]/*[contains(@class, "field-items")]').text
    case difficulty_level
    when DIFFICULTY_LEVEL_1
      @recipe.rate 1.0, current_user, 'difficulty'
    when DIFFICULTY_LEVEL_2
      @recipe.rate 2.0, current_user, 'difficulty'
    when DIFFICULTY_LEVEL_3
      @recipe.rate 3.0, current_user, 'difficulty'
    when DIFFICULTY_LEVEL_4
      @recipe.rate 4.0, current_user, 'difficulty'
    when DIFFICULTY_LEVEL_5
      @recipe.rate 5.0, current_user, 'difficulty'
    end
    
    cost_level = doc.xpath('//*[contains(@class, "field-name-field-price-level")]/*[contains(@class, "field-items")]').text
    case cost_level
    when COST_LEVEL_1
      @recipe.rate 1.0, current_user, 'cost'
    when COST_LEVEL_2
      @recipe.rate 2.0, current_user, 'cost'
    when COST_LEVEL_3
      @recipe.rate 3.0, current_user, 'cost'
    when COST_LEVEL_4
      @recipe.rate 4.0, current_user, 'cost'
    when COST_LEVEL_5
      @recipe.rate 5.0, current_user, 'cost'
    end
    
    times = Array.new
    preptime = doc.xpath('//*[contains(@class, "field-name-field-recipe-preptime")]/*[contains(@class, "field-items")]').text.strip
    if !preptime.empty?
      times << ('Préparation : ' << preptime)
    end
    cooktime = doc.xpath('//*[contains(@class, "field-name-field-recipe-cooktime")]/*[contains(@class, "field-items")]').text.strip
    if !cooktime.empty?
      times << ('Cuisson : ' << cooktime)
    end
    resttime = doc.xpath('//*[contains(@class, "field-name-field-recipe-resttime")]/*[contains(@class, "field-items")]').text.strip
    if !resttime.empty?
      times << ('Repos : ' << resttime)
    end
    @recipe.times = times.join("\n")
    
    doc.xpath('//*[contains(@class, "field field-name-categories")]/a/text()').each do |category|
      category_name = category.text.strip
      recipe_category = Category.where("lower(name) LIKE ?", category_name.chomp('s').downcase << '%').first 
      if !recipe_category.nil?
        @recipe.categories << recipe_category
      end
    end
    
    recipe_img = doc.xpath('//*[contains(@class, "field-name-field-images")]//img[contains(@class, "adv-slide")]')
    if recipe_img[0]
      recipe_img_url = recipe_img[0].attr('src')
      begin
        response = URI.parse(recipe_img_url)
        @recipe.picture = response if response
      rescue
      end
    end
  
    quatity = doc.xpath('//*[contains(@class, "field-name-field-recipe-yield")]//h2').text.strip
    if !quatity.empty?
      @recipe.quantity = quatity
    end
  
    ingredients = doc.xpath('//*[contains(@class, "field-name-field-recipe-elements")]//*[contains(@class, "field-item")]//*[contains(@class, "content")]')
    if !ingredients.empty?
      @recipe.ingredients = '<ul>'
      ingredients.each do |ingredient|
        @recipe.ingredients << '<li>' << ingredient.text.each_line.map{|r| r.strip.downcase}.reject{|x| x.strip == ""}.join(' ') << '</li>'
      end
      @recipe.ingredients << '</ul>'
    end
  
    @recipe.directions = doc.xpath('//*[contains(@class, "field-name-field-recipe-steps")]//p').to_s
    
    doc.xpath('//*[contains(@class, "field-name-field-tags")]//a/text()').each do |tag|
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
