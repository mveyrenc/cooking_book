module Application
  module Elements
    module Button
      class Base < ViewComponent::Base
        include Application::Component

        def initialize(
            url:,
            name:,
            icon: false,
            icon_only: false,
            styles: {}
        )
          @url = url
          @name = name
          @icon = icon
          @icon_only = icon_only
          self.styles = {is_light: true}.merge(styles)
        end

        def call
          link_to url, :class => css_class, :title => name, :method => link_method, :data => data do
            icon_tag + label_tag
          end
        end

        private

        attr_reader :url
        attr_reader :name
        attr_reader :icon
        attr_reader :icon_only

        private

        def label
          name unless icon_only or !icon
        end

        def link_method
          nil
        end

        def data
          {}
        end

        def icon_tag
          if icon
            content_tag :span, class: "icon is-small" do
              # FontAwesome::Icon.new(icon: icon).render_in(view_context)
              render FontAwesome::Icon.new(icon: icon)
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

        def default_css_classes
          ['button']
        end
      end
    end
  end
end