module Categories
  module Show
    class ViewComponent < ApplicationComponent
      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end