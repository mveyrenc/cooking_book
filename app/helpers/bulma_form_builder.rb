class BulmaFormBuilder < ActionView::Helpers::FormBuilder
  # alias_method :default_label, :label
  #
  # def label(method, text = nil, options = {}, &block)
  #   default_options = {class: "label"}
  #   if !options.blank?
  #     options = merge_options(default_options, options)
  #   elsif text.is_a?(Hash)
  #     options = merge_options(default_options, text)
  #     text = nil
  #   else
  #     options = default_options
  #   end
  #   default_label(method, text, options, &block)
  # end
  #
  def check_box_label(method, text = nil, options = {}, &block)
    default_options = {}
    label(method, text, merge_options(default_options, options), &block)
  end
  #
  # def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
  #   default_options = {class: "is-checkradio"}
  #   super(method, merge_options(default_options, options), checked_value, unchecked_value)
  # end
  #
  # def radio_button(method, tag_value, options = {})
  #   default_options = {class: "is-checkradio"}
  #   super(method, tag_value, merge_options(default_options, options))
  # end
  #
  # def file_field(method, options = {})
  #   default_options = {class: "file-input"}
  #   super(method, merge_options(default_options, options))
  # end
  #
  # def submit(value = nil, options = {})
  #   default_options = {class: "button"}
  #   super(value, merge_options(default_options, options))
  # end
  #
  # def button(value = nil, options = {}, &block)
  #   default_options = {class: "button"}
  #   super(value, merge_options(default_options, options), &block)
  # end
  #
  # def text_field(method, options = {})
  #   default_options = {class: "input"}
  #   super(method, merge_options(default_options, options))
  # end
  #
  # def email_field(method, options = {})
  #   default_options = {class: "input"}
  #   super(method, merge_options(default_options, options))
  # end
  #
  # def password_field(method, options = {})
  #   default_options = {class: "input"}
  #   super(method, merge_options(default_options, options))
  # end
  #
  # def text_area(object_name, method, options = {})
  #   default_options = {class: "textarea"}
  #   super(object_name, method, merge_options(default_options, options))
  # end
  #
  # def collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
  #   default_options = {wrapper_html: "select"}
  #   @template.collection_select(@object_name, method, collection, value_method, text_method, objectify_options(merge_options(default_options, options)), @default_html_options.merge(html_options))
  # end
  #
  # private
  #
  def merge_options(defaults, new_options)
    (defaults.keys + new_options.keys).inject({}) {|h, key|
      h[key] = [defaults[key], new_options[key]].compact.join(" ")
      h
    }
  end
end