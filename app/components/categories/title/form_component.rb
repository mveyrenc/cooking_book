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

      def categorization_list_by_book
        Book.all.decorate
      end

      def categorization_list
        object.book.categorizations.ordered
      end
    end
  end
end