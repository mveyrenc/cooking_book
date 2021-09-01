module Categories
  module New
    class ViewComponent < ApplicationComponent

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end