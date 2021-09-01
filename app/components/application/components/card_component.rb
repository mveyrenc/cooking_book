module Application
  module Components
    class CardComponent < ApplicationComponent

      renders_one :header
      renders_one :image
      renders_one :body
      renders_one :footer

      private

      def default_css_classes
        ['card']
      end
    end
  end
end