module Application
  module Elements
    module Button
      class BackPreview < ViewComponent::Preview
        def with_default_options
          render(
              Application::Elements::ButtonBackComponent,
              url: "#"
          )
        end

        def with_custom_name
          render(
              Application::Elements::ButtonBackComponent,
              url: "#",
              name: "Custom name"
          )
        end

        def with_custom_icon
          render(
              Application::Elements::ButtonBackComponent,
              url: "#",
              icon: "list"
          )
        end

        def without_icon
          render(
              Application::Elements::ButtonBackComponent,
              url: "#",
              icon: false
          )
        end

        def with_custom_color
          render(
              Application::Elements::ButtonBackComponent,
              url: "#",
              styles: {color: :red}
          )
        end
      end
    end
  end
end