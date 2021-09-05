module Categories
  module Classification
    class ManageComponent < ApplicationComponent
      include Turbo::FramesHelper

      def initialize(object:, last_add: nil)
        @object = object
        @last_add = last_add
      end

      private

      attr_reader :object
      attr_reader :last_add
    end
  end
end