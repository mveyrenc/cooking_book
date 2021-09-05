module Categories
  module Classification
    class ManageListComponent < ApplicationComponent
      def initialize(
        object:,
        relation:,
        related_objects:,
        last_add: nil
      )
        @object = object
        @relation = relation
        @related_objects = related_objects
        @last_add = last_add
      end

      private

      attr_reader :object
      attr_reader :relation
      attr_reader :related_objects
      attr_reader :last_add

      def related_objects?
        related_objects.nil? ? false : related_objects.any?
      end

      def preselect_object
        last_add || object
      end
    end
  end
end