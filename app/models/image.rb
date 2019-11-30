class Image < ApplicationRecord

  validates      :image,             presence: true
  
  belongs_to     :product,   optional: true
  mount_uploader :image, ImageUploader

end
