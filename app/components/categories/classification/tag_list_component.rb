module Categories
  module Classification
    class TagListComponent < ApplicationComponent
      def initialize(
        objects:,
        add_delete: false,
        relation: nil
      )
        @objects = objects
        @add_delete = add_delete
        @relation = relation
      end

      private

      attr_reader :objects
      attr_reader :add_delete
      attr_reader :relation
    end
  end
end