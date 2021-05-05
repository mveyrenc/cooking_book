module Categories
  module Classification
    class ManageListComponent < ApplicationComponent
      def initialize(
        object:,
        relation:,
        related_objects:
      )
        @object = object
        @relation = relation
        @related_objects = related_objects
      end

      private

      attr_reader :object
      attr_reader :relation
      attr_reader :related_objects

      def related_objects?
        related_objects.any?
      end

      def categorizations
        object.book.categorizations.ordered
      end
    end
  end
end