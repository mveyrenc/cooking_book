module Application
  module Elements
    module Button
      class MoveDown < Base

        def initialize(
            url:,
            name: I18n.t('application.move_down'),
            icon: 'arrow-down',
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