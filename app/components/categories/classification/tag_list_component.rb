module Categories
  module Classification
    class TagListComponent < ApplicationComponent
      def initialize(
        relation:,
        related_objects:
      )
        @relation = relation
        @related_objects = related_objects
      end

      private

      attr_reader :relation
      attr_reader :related_objects

      def related_objects?
        related_objects.nil? ? false : related_objects.any?
      end
    end
  end
end