module Bulma
  module Elements
    module Delete
      class Delete < ActionView::Component::Base
        include Stylable
        include Bulma::Size

        validates :size, inclusion: {in: SIZE.keys}, :allow_nil => true

        def initialize(
            size: nil
        )
          self.size = size
        end

        private

        def default_styles
          ['delete']
        end
      end
    end
  end
end