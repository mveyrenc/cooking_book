module Application
  module Elements
    module Button
      class MoveDown < Base

        def initialize(
            url:,
            name: I18n.t('application.move_down'),
            icon: 'arrow-down',
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