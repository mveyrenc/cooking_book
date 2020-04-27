module Application
  module Elements
    module Category
      class AdditionalTag < ViewComponent::Base
        def initialize(category:)
          @category = category
        end

        private

        attr_reader :category
      end
    end
  end
end