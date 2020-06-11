module Application
  module Elements
    module Button
      class Base < ViewComponent::Base
        include Bulma::Component

        def initialize(
            url:,
            name:,
            icon: false,
            icon_only: false,
            styles: {}
        )
          @url = url
          @name = name
          @icon = icon
          @icon_only = icon_only
          self.styles = {is_light: true}.merge(styles)
        end

        private

        attr_reader :url
        attr_reader :name
        attr_reader :icon
        attr_reader :icon_only

        private

        def default_css_classes
          ['button']
        end
      end
    end
  end
end