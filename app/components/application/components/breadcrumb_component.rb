module Application
  module Components
    class BreadcrumbComponent < ViewComponent::Base
      include Application::Component

      SEPARATOR = {
          arrow: {class: 'has-arrow-separator'},
          bullet: {class: 'has-bullet-separator'},
          dot: {class: 'has-dot-separator'},
          succeeds: {class: 'has-succeeds-separator'},
      }.freeze

      def initialize(
          html_options: {},
          styles: {}
      )
        @separator = styles[:separator] if styles.key? :separator

        self.html_options = html_options
        self.styles = styles
        compute_styles
      end

      private

      attr_reader :separator

      def separator=(separator)
        unless separator.nil?
          separator = separator.to_sym

          raise ArgumentError, "Separator #{separator} not valid" unless SEPARATOR.key? separator

          @separator = separator
          add_css_classes(SEPARATOR[separator][:class])
        end
      end

      def default_css_classes
        ['breadcrumb']
      end
    end
  end
end