class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :family_name,             presence: true
  validates :first_name,              presence: true
  validates :family_name_kana,        presence: true
  validates :first_name_kana,         presence: true
  validates :postal_code,             presence: true, length: {maximum: 8}
  validates :prefecture_id,           presence: true
  validates :municipalities,          presence: true
  validates :house_number,            presence: true



  belongs_to_active_hash :prefecture
  belongs_to :user

end
