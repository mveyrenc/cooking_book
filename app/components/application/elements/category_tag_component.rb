module Application
  module Elements
    class CategoryTagComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end