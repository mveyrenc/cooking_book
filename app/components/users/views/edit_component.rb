module Users
  module Views
    class EditComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end