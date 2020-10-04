module Recipes
  module Parts
    class RatingComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        false
      end

      def call
        # todo
      end

      private

      attr_reader :object

    end
  end
end