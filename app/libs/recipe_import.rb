require 'nokogiri'
require 'open-uri'
require 'recipe_import/parsers'
require 'recipe_import/parsers/base'
require 'recipe_import/parsers/elle'
require 'recipe_import/parsers/meilleur_du_chef'
require 'recipe_import/parsers/regal'

module RecipeImport
  def self.import(url, current_user)
    RecipeImport::Parsers.lookup(url).import(url, current_user)
  end


  class Error < StandardError
  end

  class PageNotFound < Error
  end

  class InvalidRecipe < Error
  end

  class UnknownTagError < Error
  end
end