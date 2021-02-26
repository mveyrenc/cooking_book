module ApplicationFormBuilder
  module FormField
    extend BulmaFormBuilder::FormField

    def form_field(*args, &block)
      name = args.first
      options = args.extract_options!

      if layout == :horizontal
        options = merge_options(options, { wrapper_class: 'is-horizontal' })
        content_tag(:div, class: form_field_classes(options)) do
          concat(content_tag(:div, { class: 'field-label' }) do
            field_label(name, options)
          end) unless options[:hide_label]
          concat(content_tag(:div, { class: 'field-body' }) do
            concat(content_tag(:div, { class: 'field' }) do
              concat field_control(&block)
              concat field_help(name, options)
            end)
          end)
        end
      else
        content_tag(:div, class: form_field_classes(options)) do
          concat field_label(name, options) unless options[:hide_label]
          concat field_control(&block)
          concat field_help(name, options)
        end
      end
    end

    private

    def field_label(name, options)
      classes = %w[label]
      classes << 'is-required' if options[:required]
      label(name, options[:label], class: classes)
    end

    def merge_options(defaults, new_options)
      defaults = {} if defaults.nil?
      new_options = {} if new_options.nil?
      class_options = {}
      (defaults.keys + new_options.keys).inject({}) { |h, key|
        if key.to_s.ends_with? 'class'
          class_options[key] = [defaults[key], new_options[key]].compact.join(" ")
        end
      }

      defaults.deep_merge(new_options).deep_merge(class_options)
    end
  end
end
