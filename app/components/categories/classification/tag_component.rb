module Categories
  module Classification
    class TagComponent < ApplicationComponent
      with_collection_parameter :related_object

      include BookColorableConcern


      def initialize(
        related_object:
      )
        @related_object = related_object
      end

      private

      attr_reader :related_object
    end
  end
end