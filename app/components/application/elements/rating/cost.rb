module Application
  module Elements
    module Rating
      class Cost < ActionView::Component::Base
        def initialize(note:)
          @note = note
        end

        private

        attr_reader :note
      end
    end
  end
end