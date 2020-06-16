module Application
  module Elements
    module Button
      class Back < Base
        include Bulma::Component

        def initialize(
            url:,
            name: I18n.t('application.back'),
            icon: 'list-alt',
            icon_only: false,
            styles: {}
        )
          super(
              url: url,
              name: name,
              icon: icon,
              icon_only: icon_only,
              styles: styles
          )
        end

      end
    end
  end
end