module Bulma
  module Elements
    class DeletePreview < ViewComponent::Preview
      def with_default_options
        render(
            Bulma::Elements::Delete
        )
      end

      def with_small_size
        render(
            Bulma::Elements::Delete,
            styles: {size: :small}
        )
      end

      def with_medium_size
        render(
            Bulma::Elements::Delete,
            styles: {size: :medium}
        )
      end

      def with_large_size
        render(
            Bulma::Elements::Delete,
            styles: {size: :large}
        )
      end
    end
  end
end