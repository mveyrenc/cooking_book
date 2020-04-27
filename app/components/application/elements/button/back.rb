module Application
  module Elements
    module Button
      class Back < ViewComponent::Base
        include Bulma::Component

        def initialize(
            url:,
            name: I18n.t('application.back'),
            icon: 'list-alt',
            styles: {}
        )
          @url = url
          @name = name
          @icon = icon
          self.styles = {is_light: true}.merge(styles)
        end

        private

        attr_reader :url
        attr_reader :name
        attr_reader :icon

        private

        def default_css_classes
          ['button']
        end
      end
    end
  end
end