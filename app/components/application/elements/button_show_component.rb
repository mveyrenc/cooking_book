module Application
  module Elements
    class ButtonShowComponent < ButtonBaseComponent

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