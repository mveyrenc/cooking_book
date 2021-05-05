module Users
  module List
    class ViewComponent < ApplicationComponent
      def initialize(objects:)
        @objects = objects
      end

      private

      attr_reader :objects
    end
  end
end