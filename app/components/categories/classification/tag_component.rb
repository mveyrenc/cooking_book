module Categories
  module Classification
    class TagComponent < ApplicationComponent
      with_collection_parameter :object

      include BookColorableConcern


      def initialize(
        object:,
        add_delete: false
      )
        @object = object
        @add_delete = add_delete
      end

      private

      attr_reader :object
      attr_reader :add_delete
    end
  end
end