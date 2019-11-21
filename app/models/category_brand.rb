class CategoryBrand < ApplicationRecord

  belong_to :category
  belong_to :brand

end
