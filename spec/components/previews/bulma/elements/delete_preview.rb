module Application
  module Elements
    class DeletePreview < ViewComponent::Preview
      def with_default_options
        render(
            Application::Elements::Delete::DeleteComponent
        )
      end

      def with_small_size
        render(
            Application::Elements::Delete::DeleteComponent,
            styles: {size: :small}
        )
      end

      def with_medium_size
        render(
            Application::Elements::Delete::DeleteComponent,
            styles: {size: :medium}
        )
      end

      def with_large_size
        render(
            Application::Elements::Delete::DeleteComponent,
            styles: {size: :large}
        )
      end
    end
  end
end