module Categories
  module Publication
    class InfoComponent < ApplicationComponent
      include BookColorableConcern

      def initialize(object:)
        @object = object
      end

      private

      attr_reader :object

    end
  end
end