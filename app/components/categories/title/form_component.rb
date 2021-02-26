module Categories
  module Title
    class FormComponent < ApplicationComponent
      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions

      include BookColorableConcern

      def initialize(
        object:,
        with_turbo:
      )
        @object = object
        @with_turbo = with_turbo
      end

      private

      attr_reader :object
      attr_reader :with_turbo
      alias :with_turbo? :with_turbo

    end
  end
end