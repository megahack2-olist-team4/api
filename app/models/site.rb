class Site < ApplicationRecord
  include SiteAdmin

  has_many :questions_sites
  has_many :questions, through: :questions_sites
end
