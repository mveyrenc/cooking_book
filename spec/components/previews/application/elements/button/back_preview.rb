module Application
  module Elements
    module Button
      class BackPreview < ActionView::Component::Preview
        def with_default_options
          render(
              Application::Elements::Button::Back,
              url: "#"
          )
        end

        def with_custom_name
          render(
              Application::Elements::Button::Back,
              url: "#",
              name: "Custom name"
          )
        end

        def with_custom_icon
          render(
              Application::Elements::Button::Back,
              url: "#",
              icon: "list"
          )
        end

        def without_icon
          render(
              Application::Elements::Button::Back,
              url: "#",
              icon: false
          )
        end

        def with_custom_color
          render(
              Application::Elements::Button::Back,
              url: "#",
              styles: {color: :red}
          )
        end
      end
    end
  end
end