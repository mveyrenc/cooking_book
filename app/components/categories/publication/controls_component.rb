module Categories
  module Publication
    class ControlsComponent < ApplicationComponent
      include ActionController::Helpers

      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions

      include BookColorableConcern
      include ButtonsConcern

      def initialize(object:)
        @object = object
      end

      def render?
        edit? or delete?
      end

      private

      attr_reader :object

      def edit?
        can? :update, object
      end

      def delete?
        can? :destroy, object
      end

      alias_method :original_delete_button_data, :delete_button_data
      def delete_button_data
        original_delete_button_data.merge({'turbo-frame': '_top', turbo: false, confirm: I18n.t('application.destroy_confirmation')})
      end
    end
  end
end