module Application
  module Elements
    module Button
      class NewButtonComponent < ActionView::Component::Base
        validates :url, presence: true

        def initialize(url:, name: I18n.t('application.new'), icon: 'plus')
          @url = url
          @name = name
          @icon = icon
        end

        private

        attr_reader :url
        attr_reader :name
        attr_reader :icon
      end
    end
  end
end