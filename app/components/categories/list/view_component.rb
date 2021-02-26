module Categories
  module List
    class ViewComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(objects:)
        @objects = objects
      end

      private

      attr_reader :objects
    end
  end
end