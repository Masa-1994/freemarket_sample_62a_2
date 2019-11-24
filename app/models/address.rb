class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :family_name,             presence: true #, on: :validates_step3
  validates :first_name,              presence: true #, on: :validates_step3
  validates :family_name_kana,        presence: true #, on: :validates_step3
  validates :first_name_kana,         presence: true #, on: :validates_step3
  validates :postal_code,             presence: true, length: {maximum: 8} #, on: :validates_step3
  validates :prefecture_id,           presence: true #, on: :validates_step3
  validates :municipalities,          presence: true #, on: :validates_step3
  validates :house_number,            presence: true #, on: :validates_step3



  belongs_to_active_hash :prefecture
  belongs_to :user




end
