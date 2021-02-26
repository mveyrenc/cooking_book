module Categories
  module Title
    class ShowComponent < ApplicationComponent
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