module Categories
  module Classification
    class ManageItemComponent < ApplicationComponent
      with_collection_parameter :related_object

      include ActionView::Helpers::FormTagHelper

      include BookColorableConcern


      def initialize(
        related_object:,
        object:,
        relation:
      )
        @related_object = related_object
        @object = object
        @relation = relation
      end

      private

      attr_reader :related_object
      attr_reader :object
      attr_reader :relation

      def book_color
        related_object.methods.include?(:color) ? related_object.color : 'primary'
      end
    end
  end
end