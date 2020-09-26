module Application
  module Components
    class CardFooterItemComponent < ViewComponent::Base
      include Application::Component
      include FontAwesomeHelper

      def initialize(
          url:,
          name:,
          icon:,
          method: :get,
          data: {},
          styles: {}
      )
        @url = url
        @name = name
        @icon = icon
        @method = method
        @data = data
        self.styles = {is_light: true}.merge(styles)
      end

      def call
        link_to url, :class => css_class, :title => name, :method => method, :data => data do
          render FontAwesome::Icon.new(icon: icon)
        end
      end

      private

      attr_reader :url
      attr_reader :name
      attr_reader :icon
      attr_reader :method
      attr_reader :data

      def default_css_classes
        ['card-footer-item no-print']
      end
    end
  end
end