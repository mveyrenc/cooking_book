module Application
  module Elements
    module Button
      class MoveUp < Base

        def initialize(
            url:,
            name: I18n.t('application.move_up'),
            icon: 'arrow-up',
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