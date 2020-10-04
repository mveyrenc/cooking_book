module Categories
  module Parts
    class ClassificationComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end