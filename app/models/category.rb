class Category < ApplicationRecord
  include CategoryAdmin

  serialize :keywords, Array

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :slug, presence: true, uniqueness: true

  before_validation :set_slug!

  def keywords_str
    keywords&.join(', ') || []
  end

  def keywords_str=(value)
    self.keywords = value.split(', ')
  end

  def set_slug!
    slug = name.parameterize.to_s if slug.blank? || persisted?
  end
end
