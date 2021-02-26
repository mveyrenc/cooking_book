module Recipes
  module Parts
    class TimesComponent < BaseComponent

      def render?
        !object.times.blank?
      end

      def call
        content_tag :div, class: "icon-text" do
          concat content_tag :span,
                             content_tag(
                               :i,
                               '',
                               class: "fa fa-clock fa-1x #{text_book_color}",
                               title: Recipe.human_attribute_name('times')
                             ),
                             class: "icon has-text-info"
          concat content_tag :span, simple_format(object.times), class: "#{css_book_color}"
        end
      end

    end
  end
end