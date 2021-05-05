module Users
  module List
    class ItemComponent < ApplicationComponent
      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end