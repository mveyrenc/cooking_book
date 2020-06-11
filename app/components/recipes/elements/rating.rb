module Recipes
  module Elements
    class Rating < ViewComponent::Base

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