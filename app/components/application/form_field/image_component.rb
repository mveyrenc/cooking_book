module Application::FormField
  class ImageComponent < Application::FormField::BaseComponent
    def default_html_options
      merge_options(super, { class: 'file-input' })
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