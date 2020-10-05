module Recipes
  module Parts
    class RatingCostComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        cost.present?
      end

      def call
        content_tag :div, :class => "tags has-addons" do
          concat content_tag :i, '', {
              :class => "tag fa fa-euro-sign #{text_book_color} fa-1x",
              :title => cost.categorization.to_s
          }
          concat content_tag :span, cost.to_s, {
              :class => "tag #{text_book_color}"
          }
        end
      end

      private

      attr_reader :object

      def cost
        @cost ||= object.categories.where(categorization: Categorization::COST).first
      end
    end
  end
end