module Recipes
  module Parts
    class TimesComponent < ViewComponent::Base
      include BookColorable

      def initialize(object:)
        @object = object
      end

      def render?
        !object.times.blank?
      end

      private

      attr_reader :object
    end
  end
end