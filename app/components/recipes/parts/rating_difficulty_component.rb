module Recipes
  module Parts
    class RatingDifficultyComponent < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        object.difficulty > 0
      end

      def call
        content_tag :div, :class => "tags has-addons" do
          (1..object.difficulty).each do |i|
            concat content_tag :i, '', {
                :class => "tag fa fa-graduation-cap has-text-primary fa-1x",
                :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
            }
          end
          (object.difficulty + 1..5).each do |i|
            concat content_tag :i, '', {
                :class => "tag fa fa-graduation-cap has-text-grey-lighter fa-1x",
                :title => I18n.t(Recipe.difficulty_types.invert[i], scope: 'recipes')
            }
          end
        end
      end

      private

      attr_reader :object

    end
  end
end