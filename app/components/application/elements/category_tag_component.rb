module Application
  module Elements
    class CategoryTagComponent < ViewComponent::Base
      def initialize(category:)
        @category = category
      end

      private

      attr_reader :category
    end
  end
end