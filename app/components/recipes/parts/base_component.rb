module Recipes
  module Parts
    class BaseComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

    end
  end
end