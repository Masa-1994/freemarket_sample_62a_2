class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user

  validates :municipalities, presence: true
  validates :postal_code,    length: { maximum: 8, too_long: 'は8文字以内で記入してください'}, presence: true
  validates :house_number,   presence: true

end
