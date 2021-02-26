module Recipes
  module Show
    class FormComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(
        object:,
        part:,
        with_turbo:
      )
        @object = object
        @part = part
        @with_turbo = with_turbo
      end

      private

      attr_reader :object
      attr_reader :part
      attr_reader :with_turbo
      alias :with_turbo? :with_turbo

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