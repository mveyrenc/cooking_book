module Application
  module Typography

    include Stylable

    FONT_SIZE = {
      size1: { class: 'is-size-1' },
      size2: { class: 'is-size-2' },
      size3: { class: 'is-size-3' },
      size4: { class: 'is-size-4' },
      size5: { class: 'is-size-5' },
      size6: { class: 'is-size-6' },
      size7: { class: 'is-size-7' }
    }.freeze

    TEXT_WEIGHT = {
      light: { class: 'has-text-weight-light' },
      normal: { class: 'has-text-weight-normal' },
      medium: { class: 'has-text-weight-medium' },
      semibold: { class: 'has-text-weight-semibold' },
      bold: { class: 'has-text-weight-bold' }
    }.freeze

    FONT_FAMILY = {
      sans_serif: { class: 'is-family-sans-serif' },
      monospace: { class: 'is-family-monospace' },
      primary: { class: 'is-family-primary' },
      secondary: { class: 'is-family-secondary' },
      code: { class: 'is-family-code' }
    }.freeze

    attr_reader :font_size, :text_alignment, :text_weight, :font_family

    def typography=(styles)
      self.font_size = styles[:font_size] if styles.key? :font_size
      self.font_family = styles[:font_family] if styles.key? :font_family
      self.text_weight = styles[:text_weight] if styles.key? :text_weight
    end

    def font_size=(font_size)
      unless font_size.nil?
        font_size = font_size.to_sym

        raise ArgumentError, "Font size #{font_size} not valid" unless FONT_SIZE.key? font_size

        @font_size = font_size
        add_css_classes(FONT_SIZE[font_size][:class])
      end
    end

    def font_family=(font_family)
      unless font_family.nil?
        font_family = font_family.to_sym

        raise ArgumentError, "Font family #{font_family} not valid" unless FONT_FAMILY.key? font_family

        @font_family = font_family
        add_css_classes(FONT_FAMILY[font_family][:class])
      end
    end

    def text_weight=(text_weight)
      unless text_weight.nil?
        text_weight = text_weight.to_sym

        raise ArgumentError, "Text weight #{text_weight} not valid" unless TEXT_WEIGHT.key? text_weight

        @text_weight = text_weight
        add_css_classes(TEXT_WEIGHT[text_weight][:class])
      end
    end
  end
end