module Recipes
  module Parts
    class RatingDifficultyComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        difficulty.present?
      end

      def call
        content_tag :div, :class => "tags has-addons" do
          concat content_tag :i, '', {
              :class => "tag fa fa-graduation-cap #{text_book_color} fa-1x",
              :title => difficulty.categorization.to_s
          }
          concat content_tag :span, difficulty.to_s, {
              :class => "tag #{text_book_color}"
          }
        end
      end

      private

      attr_reader :object

      def difficulty
        @difficulty ||= object.categories.where(categorization: Categorization::DIFFICULTY).first
      end
    end
  end
end