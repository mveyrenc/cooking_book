module Application
  module Elements
    class ButtonMoveUpComponent < ButtonBaseComponent

      def initialize(
          url:,
          name: I18n.t('application.move_up'),
          icon: 'arrow-up',
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