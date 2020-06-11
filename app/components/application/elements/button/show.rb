module Application
  module Elements
    module Button
      class Show < Base

        def initialize(
            url:,
            name: I18n.t('application.show'),
            icon: 'eye',
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