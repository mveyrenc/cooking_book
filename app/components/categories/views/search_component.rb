module Categories
  module Views
    class SearchComponent < ViewComponent::Base
      include BookColorable

      def initialize(
          search_params:,
          search_result:
      )
        @search_params = search_params
        @search_result = search_result
      end

      private

      attr_reader :search_params
      attr_reader :search_result
    end
  end
end