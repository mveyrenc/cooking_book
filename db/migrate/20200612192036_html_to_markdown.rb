class HtmlToMarkdown < ActiveRecord::Migration[6.0]
  def self.up
    Recipe.reset_column_information
    Recipe.all.each do |r|
      r.ingredients = ReverseMarkdown.convert r.ingredients
      r.directions = ReverseMarkdown.convert r.directions
      r.description = ReverseMarkdown.convert r.description

      r.save
    end
  end

  def self.down
  end
end
