module Application
  module Alignment

    include Stylable

    ALIGNMENT = {
        centered: {class: 'centered'},
        justified: {class: 'justified'},
        left: {class: 'left'},
        right: {class: 'right'}
    }.freeze

    attr_reader :alignment, :text_alignment

    def alignments=(styles)
      self.alignment = styles[:alignment] if styles.key? :alignment
      self.text_alignment = styles[:text_alignment] if styles.key? :text_alignment
    end

    def alignment=(alignment)
      unless alignment.nil?
        alignment = alignment.to_sym

        raise ArgumentError, "Alignment #{alignment} not valid" unless ALIGNMENT.key? alignment

        @alignment = alignment
        add_css_classes('is-' + ALIGNMENT[alignment][:class])
      end
    end

    def text_alignment=(text_alignment)
      unless text_alignment.nil?
        text_alignment = text_alignment.to_sym

        raise ArgumentError, "Text alignment #{text_alignment} not valid" unless ALIGNMENT.key? text_alignment

        @text_alignment = text_alignment
        add_css_classes('has-text-' + ALIGNMENT[text_alignment][:class])
      end
    end
  end
end