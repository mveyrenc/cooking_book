module Recipes
  module Show
    class FormComponent < ApplicationComponent
      include BookColorableConcern

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
          create_recipe_path
        else
          edit_recipe_path(object, part: part)
        end
      end
    end
  end
end