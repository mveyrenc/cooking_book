module Bulma
  module Color

    include Stylable

    COLORS = {
        primary: {class: 'primary'},
        link: {class: 'link'},
        info: {class: 'info'},
        success: {class: 'success'},
        warning: {class: 'warning'},
        danger: {class: 'danger'},
        deep_yellow: {class: 'deep-yellow'},
        yellow: {class: 'yellow'},
        orange: {class: 'orange'},
        deep_orange: {class: 'deep-orange'},
        red: {class: 'red'},
        pink: {class: 'pink'},
        deep_purple: {class: 'deep-purple'},
        purple: {class: 'purple'},
        indigo: {class: 'indigo'},
        blue: {class: 'blue'},
        light_blue: {class: 'light-blue'},
        cyan: {class: 'cyan'},
        teal: {class: 'teal'},
        turquoise: {class: 'turquoise'},
        light_green: {class: 'light-green'},
        green: {class: 'green'},
        brown: {class: 'brown'},
        charcoal: {class: 'charcoal'},
        gray_dark: {class: 'gray-dark'},
        asphalt: {class: 'asphalt'},
        gray: {class: 'gray'},
    }.freeze

    attr_reader :is_light
    attr_reader :main_color, :background_color, :text_color

    def is_light=(is_light)
      @is_light = is_light
      if @is_light
        add_is_light_styles
      else
        remove_is_light_styles
      end
    end

    def main_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
        rescue ArgumentError => e
          raise ArgumentError, 'Main ' + e.message.downcase
        end

        @main_color = base_color
        add_main_color_styles
      end
    end

    def background_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
        rescue ArgumentError => e
          raise ArgumentError, 'Background ' + e.message.downcase
        end

        @background_color = base_color
        add_background_color_styles
      end
    end

    def text_color=(color)
      unless color.nil?
        begin
          base_color = detect_color color
        rescue ArgumentError => e
          raise ArgumentError, 'Text ' + e.message.downcase
        end

        @text_color = base_color
        add_text_color_styles

      end
    end

    private

    def detect_color(color)
      for valid_color in COLORS.keys
        return valid_color.to_sym if color.to_s.start_with? valid_color.to_s
      end

      raise ArgumentError, 'Color not valid'
    end

    def add_is_light_styles
      if self.is_light
        self.add_styles 'is-light'
      end
    end

    def remove_is_light_styles
      if self.is_light
        self.remove_styles 'is-light'
      end
    end

    def add_main_color_styles
      unless self.main_color.nil?
        self.add_styles(get_color_css_class 'is', self.main_color)
      end
    end

    def add_background_color_styles
      unless self.background_color.nil?
        self.add_styles(get_color_css_class 'has-background', self.background_color)
      end
    end

    def add_text_color_styles
      unless self.text_color.nil?
        self.add_styles(get_color_css_class 'has-text', self.text_color)
      end
    end

    def get_color_css_class(prefix, color)
      css_class = [prefix, COLORS[color][:class]]
      css_class.join('-')
    end
  end
end