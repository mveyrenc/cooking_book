module Recipes
  module Parts
    class MediaGalleryComponent < BaseComponent

      def render?
        !object.picture.blank?
      end

      def call
        image_tag object.picture.url(:medium)
      end
    end
  end
end