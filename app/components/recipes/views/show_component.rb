module Recipes
  module Views
    class ShowComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end