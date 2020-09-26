module Recipes
  module Parts
    class RatingCostComponent < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      def render?
        object.cost > 0
      end

      def call
        content_tag :div, :class => "tags has-addons" do
          (1..object.cost).each do |i|
            concat content_tag :i, '', {
                :class => "tag fa fa-euro-sign has-text-primary fa-1x",
                :title => I18n.t(Recipe.cost_types.invert[i], scope: 'recipes')
            }
          end
          (object.cost + 1..5).each do |i|
            concat content_tag :i, '', {
                :class => "tag fa fa-euro-sign has-text-grey-lighter fa-1x",
                :title => I18n.t(Recipe.cost_types.invert[i], scope: 'recipes')
            }
          end
        end
      end

      private

      attr_reader :object

    end
  end
end