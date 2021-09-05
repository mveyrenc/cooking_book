module Recipes
  module Search
    class FormComponent < ApplicationComponent
      def initialize(query:, result:)
        @query = query
        @result = result
      end

      private

      attr_reader :query
      attr_reader :result
    end
  end
end