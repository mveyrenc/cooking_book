module Recipes
  module Parts
    class RatingCostComponent < BaseComponent

      def render?
        cost.present?
      end

      def call
        content_tag :div, :class => "icon-text" do
          concat content_tag :span,
                             content_tag(
                               :i,
                               '',
                               class: "fa fa-euro-sign fa-1x #{text_book_color}",
                               title: cost.categorization.to_s
                             ),
                             class: "icon has-text-info"
          concat content_tag :span, cost.to_s, class: "#{css_book_color}"
        end
      end

      private

      def cost
        @cost ||= object.categories.where(categorization: Categorization::COST).first
      end
    end
  end
end