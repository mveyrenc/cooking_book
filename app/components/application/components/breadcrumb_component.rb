module Application
  module Components
    class BreadcrumbComponent < ApplicationComponent
      def initialize(
        breadcrumb_trail:
      )
        @breadcrumb_trail = breadcrumb_trail
      end

      private

      attr_reader :breadcrumb_trail

      def default_css_classes
        ['breadcrumb']
      end
    end
  end
end