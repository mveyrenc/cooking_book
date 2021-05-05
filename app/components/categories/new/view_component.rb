module Categories
  module New
    class ViewComponent < ApplicationComponent
      include Turbo::FramesHelper

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end