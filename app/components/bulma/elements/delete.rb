module Bulma
  module Elements
    class Delete < ActionView::Component::Base
      include Bulma::Component

      def initialize(
          styles: {}
      )
        self.styles = styles
      end

      private

      def default_css_classes
        ['delete']
      end
    end
  end
end