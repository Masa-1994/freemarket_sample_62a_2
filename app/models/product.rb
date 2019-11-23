class Product < ApplicationRecord

  # validation
  validates :name, length: { in: 1..40}, presence: true
  validates :description, length: { in: 1..1000}, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9999999}

  # associate
  belongs_to                    :user
  belongs_to                    :category
  belongs_to                    :size,        optional: true
  belongs_to                    :brand,       optional: true
  has_many                      :comments,    dependent: :destroy
  has_many                      :nices,       dependent: :destroy
  has_many                      :evaluations, dependent: :destroy
  has_many                      :images,      dependent: :destroy
  accepts_nested_attributes_for :images,      allow_destroy: true
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"

end
