module Bulma
  module Typography

    include Stylable

    FONT_SIZE = {
        size1: {class: 'is-size-1'},
        size2: {class: 'is-size-2'},
        size3: {class: 'is-size-3'},
        size4: {class: 'is-size-4'},
        size5: {class: 'is-size-5'},
        size6: {class: 'is-size-6'},
        size7: {class: 'is-size-7'}
    }.freeze

    TEXT_ALIGNMENT = {
        centered: {class: 'has-text-centered'},
        justified: {class: 'has-text-justified'},
        left: {class: 'has-text-left'},
        right: {class: 'has-text-right'}
    }.freeze

    TEXT_WEIGHT = {
        light: {class: 'has-text-weight-light'},
        normal: {class: 'has-text-weight-normal'},
        medium: {class: 'has-text-weight-medium'},
        semibold: {class: 'has-text-weight-semibold'},
        bold: {class: 'has-text-weight-bold'}
    }.freeze

    FONT_FAMILY = {
        sans_serif: {class: 'is-family-sans-serif'},
        monospace: {class: 'is-family-monospace'},
        primary: {class: 'is-family-primary'},
        secondary: {class: 'is-family-secondary'},
        code: {class: 'is-family-code'}
    }.freeze

    attr_reader :font_size, :text_alignment, :text_weight, :font_family

    def font_size=(font_size)
      unless font_size.nil?
        @font_size = detect_font_size font_size
        add_font_size_style
      end
    end

    def text_alignment=(text_alignment)
      unless text_alignment.nil?
        @text_alignment = detect_text_alignment text_alignment
        add_text_alignment_style
      end
    end

    def text_weight=(text_weight)
      unless text_weight.nil?
        @text_weight = detect_text_weight text_weight
        add_text_weight_style
      end
    end

    def font_family=(font_family)
      unless font_family.nil?
        @font_family = detect_font_family font_family
        add_font_family_style
      end
    end

    private

    def detect_font_size(font_size)
      font_size = font_size.to_sym
      return font_size if FONT_SIZE.key? font_size
      raise ArgumentError, 'Font size not valid'
    end

    def detect_text_alignment(text_alignment)
      text_alignment = text_alignment.to_sym
      return text_alignment if TEXT_ALIGNMENT.key? text_alignment
      raise ArgumentError, 'Text alignment not valid'
    end

    def detect_text_weight(text_weight)
      text_weight = text_weight.to_sym
      return text_weight if TEXT_WEIGHT.key? text_weight
      raise ArgumentError, 'Text weight not valid'
    end

    def detect_font_family(font_family)
      font_family = font_family.to_sym
      return font_family if FONT_FAMILY.key? font_family
      raise ArgumentError, 'Font family not valid'
    end

    def add_font_size_style
      unless self.font_size.nil?
        self.add_styles(FONT_SIZE[self.font_size][:class])
      end
    end

    def add_text_alignment_style
      unless self.text_alignment.nil?
        self.add_styles(TEXT_ALIGNMENT[self.text_alignment][:class])
      end
    end

    def add_text_weight_style
      unless self.text_weight.nil?
        self.add_styles(TEXT_WEIGHT[self.text_weight][:class])
      end
    end

    def add_font_family_style
      unless self.font_family.nil?
        self.add_styles(FONT_FAMILY[self.font_family][:class])
      end
    end
  end
end