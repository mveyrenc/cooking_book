module Recipes
  module New
    class ViewComponent < ApplicationComponent
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
    end
  end
end