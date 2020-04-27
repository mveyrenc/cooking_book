module Application
  module Elements
    module Button
      class Edit < Base

        def initialize(
            url:,
            name: I18n.t('application.edit'),
            icon: 'edit',
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