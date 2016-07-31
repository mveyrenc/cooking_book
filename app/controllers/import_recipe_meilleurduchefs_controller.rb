class ImportRecipeMeilleurduchefsController < ApplicationController
  
  require 'nokogiri'
  require 'open-uri'

  DIFFICULTY_LEVEL_1 = 'width:33.3333333333333%'
  DIFFICULTY_LEVEL_2 = 'Not defined'
  DIFFICULTY_LEVEL_3 = 'width:66.6666666666666%'
  DIFFICULTY_LEVEL_4 = 'Not defined'
  DIFFICULTY_LEVEL_5 = 'width:100%'
  
  def new
    authorize! :create, Recipe
    @import_recipe = ImportRecipeMeilleurduchef.new
    @import_recipe.url
  end
  
  def create
    authorize! :create, Recipe
    @import_recipe = ImportRecipeMeilleurduchef.new(import_recipe_meilleurduchef_params)
      
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

  def import_recipe_meilleurduchef_params
    params.require(:import_recipe_meilleurduchef).permit(:url)
  end
  
  def sniffe
    @recipe = Recipe.new
    @recipe.author = current_user
    @recipe.modifier = current_user
    
    response = open(@import_recipe.url) rescue nil
    doc = Nokogiri::HTML(response)
    
    @recipe.name = doc.css('h1').first.text
    
    difficulty_level = doc.css('.difficulty-bar .pc').first
    case difficulty_level["style"]
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
    
    time = doc.css('meta[itemprop=totalTime]').first
    if !time.nil?
      @recipe.times = 'Durée : ' << time.parent.text.strip
    end
    
    doc.css('#compass span[itemprop=title]').each do |category|
      category_name = category.text.strip
      recipe_category = Category.where("lower(name) LIKE ?", category_name.chomp('s').downcase << '%').first 
      if !recipe_category.nil?
        @recipe.categories << recipe_category
      end
    end
    
    recipe_img = doc.css('#media-section img').first
    if !recipe_img.nil?
      recipe_img_url = 'https:' << recipe_img['src']
      begin
        response = URI.parse(recipe_img_url)
        @recipe.picture = response if response
      rescue
      end
    end
  
    quatity = doc.css('span[itemprop=recipeYield]').first
    if !quatity.nil?
      @recipe.quantity = 'Pour : ' << quatity.text.strip
    end
  
    ingredients = doc.css('.ingredients ul')
    ingredients_text = ''
    ingredients.each do |ingredient|
      ingredient.children.each do |ingredient_li|
        if ingredient_li.content == 'Matériel utilisé :'
          break
        end
        if ingredient_li.attr('class') == 'subtitle'
          ingredients_text << '<li><b>' + ingredient_li.content + '</b></li>'
        else
          ingredient_li.remove_attribute('class')
          ingredient_li.remove_attribute('itemprop')
          ingredient_li.css("a").each do |ingredient_li_a|
             ingredient_li_a.replace(ingredient_li_a.content)
          end
          ingredients_text << ingredient_li.to_s
        end
      end
    end
    @recipe.ingredients = ingredients_text
    
    description = doc.css('#presentation .texte').first
    if !description.nil?
      @recipe.description = description.text.strip
    end
  
    @recipe.directions = doc.css('#instructions-section .instruction p').to_s
  
    author = doc.css('meta[itemprop=author]').first
    if !author.nil?
      recipe_source = Source.where("lower(name) LIKE ?", author.text.strip).ordered.first
      if !recipe_source.nil?
        @recipe.sources << recipe_source
      end
      @recipe.sources = quatity
    end
      
    recipe_source = Source.where("lower(name) LIKE ?", 'meilleur du chef').ordered.first
    if !recipe_source.nil?
      @recipe.sources << recipe_source
    end
    
    @recipe.save
  end

end
