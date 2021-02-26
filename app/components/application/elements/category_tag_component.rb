module Application
  module Elements
    class CategoryTagComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end