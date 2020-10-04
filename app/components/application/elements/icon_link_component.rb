module Application
  module Elements
    class IconLinkComponent < ViewComponent::Base
      include Application::Component

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

        self.styles = styles
        compute_styles
      end

      def call
        link_to url, :class => css_class, :title => name, :method => method, :data => data do
          render Application::Elements::FontAwesomeIconComponent.new(icon: icon)
        end
      end

      private

      attr_reader :url
      attr_reader :name
      attr_reader :icon
      attr_reader :method
      attr_reader :data
    end
  end
end