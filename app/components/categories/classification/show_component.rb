module Categories
  module Classification
    class ShowComponent < ApplicationComponent
      include Turbo::FramesHelper

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end