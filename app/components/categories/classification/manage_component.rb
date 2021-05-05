module Categories
  module Classification
    class ManageComponent < ApplicationComponent
      include Turbo::FramesHelper

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object
    end
  end
end