module Recipes
  module Views
    class NewComponent < ViewComponent::Base
      include BookColorable

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