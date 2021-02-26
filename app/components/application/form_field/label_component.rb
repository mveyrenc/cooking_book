module Application::FormField
  class LabelComponent < Application::FormField::BaseComponent
    private

    attr_reader :text

    def initialize_options(options)
      @text = options.fetch(:text, nil)
      super(options)
    end

    def default_html_options
      merge_options(super, { class: 'label' })
    end
  end
end