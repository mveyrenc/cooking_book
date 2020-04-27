module Application
  module Elements
    module Button
      class Back < Base
        include Bulma::Component

        def initialize(
            url:,
            name: I18n.t('application.back'),
            icon: 'list-alt',
            styles: {}
        )
          super(
              url: url,
              name: name,
              icon: icon,
              styles: styles
          )
        end
      end
    end
  end
end