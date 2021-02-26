module Application
  module Elements
    class ButtonBaseComponent < ApplicationComponent

      def initialize(
        name:,
        icon: false,
        icon_only: false
      )
        @name = name
        @icon = icon
      end

      def call
        icon_tag + label_tag
      end

      private

      attr_reader :name
      attr_reader :icon
      attr_reader :icon_only

      private

      def label
        name unless icon_only or !icon
      end

      def icon_tag
        if icon
          content_tag :span, class: "icon is-small" do
            render Application::Elements::FontAwesomeIconComponent.new(icon: icon)
          end
        end
      end

      def label_tag
        if label
          content_tag :span do
            label
          end
        end
      end
    end
  end
end