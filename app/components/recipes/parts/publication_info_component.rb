module Recipes
  module Parts
    class PublicationInfoComponent < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

    end
  end
end