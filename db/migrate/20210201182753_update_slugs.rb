class UpdateSlugs < ActiveRecord::Migration[6.0]
  def self.up
    Category.find_each { |i| i.slug = nil; i.save!; }
    Recipe.find_each { |i| i.slug = nil; i.save!; }
  end

  def self.down
  end
end
