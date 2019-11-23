class Category < ApplicationRecord

  has_many :products
  has_many :sizes, through: :categories_sizes
  has_many :categories_sizes
  has_many :brands, through: :categories_brands
  has_many :categories_brands

  has_ancestry

  belongs_to :parent, class_name: :Category
  has_many :children, class_name: :Category

end
