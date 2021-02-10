module Recipes
  module FormParts
    class BaseComponent < Recipes::Parts::BaseComponent

      def initialize(
        object:,
        form:
      )
        super object: object
        @form = form
      end

      private

      attr_reader :form

    end
  end
end