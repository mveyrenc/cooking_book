module Users
  module Views
    class ListComponent < ViewComponent::Base
      include BookColorable

      def initialize(
          objects:
      )
        @objects = objects
      end

      private

      attr_reader :objects
    end
  end
end