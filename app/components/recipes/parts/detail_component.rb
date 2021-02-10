module Recipes
  module Parts
    class DetailComponent < BaseComponent

      PART_RECIPE = 'recipe'
      PART_MASTERCLASS = 'masterclass'
      PART_MEDIA = 'media'
      PART_CLASSIFICATION = 'classification'
      PART_SIMILAR_RECIPES = 'similar-recipes'
      PART_MENUS = 'menus'
      PART_OPINIONS = 'opinions'
      PART_EDITORIAL_INFORMATION = 'editorial-information'
      PART_COMPOSITION = 'composition'
      PART_TIMES = 'times'
      PART_INGREDIENTS = 'ingredients'
      PART_DIRECTIONS = 'directions'
      PART_IMPORT = 'import'

      def initialize(
        object:,
        part:
      )
        super object: object
        @part = part
      end

      private

      attr_reader :part
    end
  end
end