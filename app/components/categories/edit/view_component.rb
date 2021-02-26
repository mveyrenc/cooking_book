module Categories
  module Edit
    class ViewComponent < ApplicationComponent
      include Turbo::FramesHelper

      include BookColorableConcern

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end