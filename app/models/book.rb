class Book < ApplicationRecord

  COOKING = create_with(name: I18n.t('book.item.cooking.name')).find_or_create_by(slug: 'cooking').freeze
  HEALTH_WELLNESS = create_with(name: I18n.t('book.item.health_wellness.name')).find_or_create_by(slug: 'health-wellness').freeze
  HOUSE = create_with(name: I18n.t('book.item.house.name')).find_or_create_by(slug: 'house').freeze

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :recipes

  def to_s
    name
  end

  def to_i
    id
  end

end
