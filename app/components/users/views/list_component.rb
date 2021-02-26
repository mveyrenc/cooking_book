module Users
  module Views
    class ListComponent < ApplicationComponent
      include BookColorableConcern

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