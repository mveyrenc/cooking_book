module Application
  module Elements
    module Button
      class Delete < Base

        def initialize(
            url:,
            name: I18n.t('application.destroy'),
            icon: 'trash',
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

        private

        def link_method
          :delete
        end

        def data
          {confirm: I18n.t('application.destroy_confirmation')}
        end

      end
    end
  end
end