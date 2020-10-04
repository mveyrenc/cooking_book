class Book < ApplicationRecord

  COOKING = create_with(name: I18n.t('books.item.cooking.name')).find_or_create_by(slug: 'cooking').freeze
  HEALTHWELLNESS = create_with(name: I18n.t('books.item.healthwellness.name')).find_or_create_by(slug: 'healthwellness').freeze
  HOUSE = create_with(name: I18n.t('books.item.house.name')).find_or_create_by(slug: 'house').freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :categorizations
  has_many :recipes

  def categories
    Category.joins(:categorization).where(categorizations: {book: self})
  end

  def color
    slug.parameterize.underscore.to_sym
  end

  def to_s
    name
  end

  def to_i
    id
  end

end
