module Categories
  module Search
    class ViewComponent < ApplicationComponent
      include BookColorableConcern
      include ButtonsConcern

      def initialize(
        query:,
        result:
      )
        @query = query
        @result = result
      end

      private

      attr_reader :query
      attr_reader :result
    end
  end
end