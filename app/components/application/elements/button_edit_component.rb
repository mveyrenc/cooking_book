module Application
  module Elements
    class ButtonEditComponent < ButtonBaseComponent

      def initialize(
        url:,
        name: I18n.t('application.edit'),
        icon: 'edit',
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