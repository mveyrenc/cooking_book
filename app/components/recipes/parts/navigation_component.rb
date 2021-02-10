module Recipes
  module Parts
    class NavigationComponent < BaseComponent
      include ActionController::Helpers
      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions

      def initialize(
        object:,
        part:
      )
        super object: object
        @part = part
      end

      private

      attr_reader :part

      def link_to_show(link_part)
        is_active_class = (action_name == 'show' and part == link_part) ? 'is-active' : nil
        link_to I18n.t("recipes.navigation.show.#{link_part}"), book_recipe_path(object.book, object, part: link_part), class: is_active_class, part: link_part
      end

      def link_to_edit(link_part)
        is_active_class = (action_name != 'show' and part == link_part) ? 'is-active' : nil
        link_to I18n.t("recipes.navigation.edit.#{link_part}"), edit_book_recipe_path(object.book, object, part: link_part), class: is_active_class
      end

      def control?
        edit? or delete?
      end

      def edit?
        can? :update, object
      end

      def delete?
        can? :destroy, object
      end
    end
  end
end