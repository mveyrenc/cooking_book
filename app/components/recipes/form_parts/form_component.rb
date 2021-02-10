module Recipes
  module FormParts
    class FormComponent < ViewComponent::Base
      include BookColorable

      def initialize(
        object:,
        part:
      )
        @object = object
        @part = part
      end

      private

      attr_reader :object
      attr_reader :part

      def form_url
        if object.new_record?
          book_recipes_path(object.book, part: part)
        else
          book_recipe_path(object.book, object, part: part)
        end
      end
    end
  end
end