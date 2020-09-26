module Application
  module Elements
    module Delete
      class DeleteComponent < ViewComponent::Base
        include Application::Component

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
end