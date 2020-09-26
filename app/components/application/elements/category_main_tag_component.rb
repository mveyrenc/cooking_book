module Application
  module Elements
    class CategoryMainTagComponent < ViewComponent::Base
      def initialize(category:)
        @category = category
      end

      private

      attr_reader :category
    end
  end
end