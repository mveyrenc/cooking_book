module Recipes
  module Parts
    class PublicationInfo < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

    end
  end
end