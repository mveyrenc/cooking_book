module Categories
  module Parts
    class PublicationControlsComponent < ViewComponent::Base
      include ActionController::Helpers
      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions
      include BookColorable

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

      def control?
        edit? or delete?
      end

      def edit?
        can? :update, object
      end

      def delete?
        can? :destroy, object
      end
    end
  end
end