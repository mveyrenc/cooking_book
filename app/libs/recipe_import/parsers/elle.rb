module RecipeImport
  module Parsers
    class Elle < Base

      def name(document)
        extract_first_text document, '.fiche-pdt h1'
      end

      def categories_node(document)
        document.css('.fiche-pdt .keywords')
      end

      def picture_img_node(document)
        document.css('.fiche-pdt .hover-image a').first
      end

      def picture_img_attr
        'href'
      end

      def ingredients(document)
        i = document.css(
            '.fiche-pdt .ingredients-list'
        )
        i.css('a').each do |a|
          a.replace(a.text)
        end
        i.css('span').each do |s|
          s.remove
        end
        markdown(i.to_s)
      end

      def description(document)
        markdown(document.css(
            '.fiche-pdt .recette-chapeau'
        ).to_s)
      end

      def directions(document)
        d = document.css(
            '.fiche-pdt .listing-prepa',
            '.fiche-pdt .astuce',
        )
        d.css('a', 'span', 'p').each do |r|
          r.replace(r.inner_html)
        end
        d.css('li').each do |r|
          r.name = 'p'
        end
        markdown(d.to_s)
      end

      def sources(document)
        r = super(document)
        e = Categorization::SOURCE.categories.where("lower(name) LIKE ?", 'elle à table').ordered.first
        unless e.nil?
          r << e
        end
        r
      end
    end

    register :elle_fr, Elle.new
  end
end