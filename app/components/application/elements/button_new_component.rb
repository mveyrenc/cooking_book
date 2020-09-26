module Application
  module Elements
    class ButtonNewComponent < ButtonBaseComponent

      def initialize(
          url:,
          name: I18n.t('application.new'),
          icon: 'plus',
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