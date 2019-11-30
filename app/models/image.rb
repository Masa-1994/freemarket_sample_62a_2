class Image < ApplicationRecord

  validates      :family_name,             presence: true
  
  belongs_to     :product,   optional: true
  mount_uploader :image, ImageUploader

end
