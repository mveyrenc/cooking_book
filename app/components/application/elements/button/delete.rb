module Application
  module Elements
    module Button
      class Delete < Base

        def initialize(
            url:,
            name: I18n.t('application.destroy'),
            icon: 'trash',
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