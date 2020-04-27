module Bulma
  module Elements
    module Notification
      class Notification < ViewComponent::Base
        include Bulma::Component

        def initialize(
            styles: {},
            delete: true,
            delete_styles: {}
        )
          self.styles = styles

          @delete = delete
          @delete_styles = delete_styles
        end

        private

        attr_reader :delete
        attr_reader :delete_styles

        alias :delete? :delete

        def default_css_classes
          ['notification']
        end
      end
    end
  end
end