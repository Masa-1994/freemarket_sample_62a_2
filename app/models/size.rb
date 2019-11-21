class Size < ApplicationRecord

  has_many :products
  has_many :categories, through: :categories_sizes
  has_many :categories_sizes
  
end
