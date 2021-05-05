module Users
  module Show
    class FormComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(
        object:
      )
        @object = object
      end

      private

      attr_reader :object
    end
  end
end