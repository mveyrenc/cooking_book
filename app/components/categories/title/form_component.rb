module Categories
  module Title
    class FormComponent < ApplicationComponent
      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions

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