module Recipes
  module Parts
    class BaseComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

    end
  end
end