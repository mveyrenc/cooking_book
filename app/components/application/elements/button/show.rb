module Application
  module Elements
    module Button
      class Show < Base

        def initialize(
            url:,
            name: I18n.t('application.show'),
            icon: 'eye',
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