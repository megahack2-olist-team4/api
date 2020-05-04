class Site < ApplicationRecord
  include SiteAdmin

  has_and_belongs_to_many :questions
end
