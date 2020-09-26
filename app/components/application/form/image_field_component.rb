module Application
  module Form
    class ImageFieldComponent < ViewComponent::Base
      include Application::Form::FieldBaseComponent

      def initialize(*args)
        initialize_field(**args.extract_options!)
      end

      def default_html_options
        merge_options(super, {class: 'file-input'})
      end

      private

      def image
        @image ||= resource.send(method.to_sym)
      end

      def image?
        !image.nil?
      end
    end
  end
end