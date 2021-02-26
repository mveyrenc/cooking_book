module Recipes
  module Card
    class ViewComponent < ApplicationComponent
      include ActionController::Helpers
      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions
      include BookColorableConcern

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end