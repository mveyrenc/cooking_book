module Categories
  module Classification
    class SearchComponent < ApplicationComponent
      include Turbo::FramesHelper

      def initialize(
        object:,
        query: {query: ''},
        result: []
      )
        @object = object
        @query = query
        @result = result
      end

      private

      attr_reader :object
      attr_reader :query
      attr_reader :result
    end
  end
end