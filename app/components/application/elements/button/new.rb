module Application
  module Elements
    module Button
      class New < Base

        def initialize(
            url:,
            name: I18n.t('application.new'),
            icon: 'plus',
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