module Recipes
  module Parts
    class RatingDifficultyComponent < BaseComponent

      def render?
        difficulty.present?
      end

      def call
        content_tag :div, :class => "icon-text" do
          concat content_tag :span,
                             content_tag(
                               :i,
                               '',
                               class: "fa fa-graduation-cap fa-1x #{text_book_color}",
                               title: difficulty.categorization.to_s
                             ),
                             class: "icon has-text-info"
          concat content_tag :span, difficulty.to_s, class: "#{css_book_color}"
        end
      end

      private

      def difficulty
        @difficulty ||= object.categories.where(categorization: Categorization::DIFFICULTY).first
      end
    end
  end
end