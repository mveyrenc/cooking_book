module Application
  module Components
    class CardFooterItemComponent < Application::Elements::IconLinkComponent

      def initialize(
        url:,
        name:,
        icon:,
        method: :get,
        data: {},
        styles: {}
      )
        super
      end

      private

      def default_css_classes
        ['card-footer-item no-print']
      end
    end
  end
end