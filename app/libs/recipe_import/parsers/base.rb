module RecipeImport
  module Parsers
    class Base

      def import(book, url, current_user)
        document = get_document(url)
        if document.nil?
          raise PageNotFound, %w"${url} not found"
        end

        begin
          recipe = Recipe.new
          recipe.book = book
          recipe.author = current_user
          recipe.modifier = current_user
          recipe.name = name(document)
          recipe.difficulty = difficulty(document)
          recipe.cost = cost(document)
          recipe.times = times(document)
          recipe.categories = categories(document)
          recipe.picture = picture(document)
          recipe.quantity = quantity(document)
          recipe.description = description(document)
          recipe.ingredients = ingredients(document)
          recipe.main_ingredients = main_ingredients(document)
          recipe.directions = directions(document)
          recipe.sources = sources(document)

          recipe
        rescue => e
          print e.message

          raise e
        end
      end

      protected

      def get_document(url)
        response = open(url) rescue nil
        Nokogiri::HTML(response)
      end

      def name(document)
        raise NotImplementedError
      end

      def difficulty(document)
        nil
      end

      def cost(document)
        nil
      end

      def times(document)
        nil
      end

      def categories(document)
        r = Array.new
        l = categories_node(document)
        unless l.nil?
          l.each do |c|
            n = c.text.strip
            e = Category.where("lower(name) LIKE ?", n.downcase.chomp('s').downcase << '%').first
            unless e.nil?
              r << e
            end
          end
        end
        r
      end

      def categories_node(document)
        nil
      end

      def picture(document)
        n = picture_img_node(document)
        unless n.nil?
          url = n[picture_img_attr]
          url.prepend('https:') if url.start_with? '//'
          begin
            io = URI.open(URI.parse(url))
            unless io.nil?
              io.base_uri.path.split('/').last.blank? ? nil : io
            end
          rescue
            nil
          end
        end
      end

      def picture_img_node(document)
        nil
      end

      def picture_img_attr
        'src'
      end

      def quantity(document)
        nil
      end

      def ingredients(document)
        nil
      end

      def main_ingredients(document)
        Array.new
      end

      def description(document)
        nil
      end

      def directions(document)
        nil
      end

      def sources(document)
        r = Array.new
        l = sources_node(document)
        unless l.nil?
          l.each do |c|
            n = c.text.strip
            e = Categorization::COOKING_SOURCE.categories.where("lower(name) LIKE ?", n.downcase.chomp('s').downcase << '%').first
            unless e.nil?
              r << e
            end
          end
        end
        r
      end

      def sources_node(document)
        nil
      end

      def markdown(text)
        ReverseMarkdown.convert(clean_text(text)).gsub('&nbsp;', ' ')
      end

      def clean_text(text)
        text.gsub('oe', 'œ').gsub('Oe', 'Œ')
      end

      def extract_first_text(document, selector)
        n = document.css(selector).first

        unless n.nil?
          clean_text(n.text.strip)
        end
      end

      def extract_parent_text(document, selector)
        n = document.css(selector).first

        unless n.nil?
          clean_text(n.parent.text.strip)
        end
      end
    end
  end
end