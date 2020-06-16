module Application
  module Elements
    module Tag
      class Tag < ViewComponent::Base
        include Application::Component

        def initialize(
            styles: {}
        )
          self.styles = styles
        end

        private

        def default_css_classes
          ['tag']
        end
      end
    end
  end
end