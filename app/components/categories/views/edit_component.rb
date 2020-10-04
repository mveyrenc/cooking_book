module Categories
  module Views
    class EditComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end