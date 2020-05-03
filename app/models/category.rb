class Category < ApplicationRecord
  include CategoryAdmin

  serialize :keywords, Array

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }

  def keywords_str
    keywords.join(', ')
  end

  def keywords_str=(value)
    self.keywords = value.split(', ')
  end
end
