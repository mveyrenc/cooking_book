module Categories
  module Show
    class ViewComponent < ApplicationComponent
      include Devise::Controllers::Helpers
      include CanCan::ControllerAdditions

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

      def manage?
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