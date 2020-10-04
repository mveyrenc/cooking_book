module Recipes
  module Parts
    class BannerComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

    end
  end
end