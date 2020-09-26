module Recipes
  module Parts
    class BannerComponent < ViewComponent::Base

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end