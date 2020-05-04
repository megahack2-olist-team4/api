class Product < ApplicationRecord
  include ProductAdmin

  belongs_to :category
end
