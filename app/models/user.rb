class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates               :nickname,           length: {in: 1..15}, presence: true
  validates               :email,              length: {maximum: 50}, presence: true, format: {with: /\A\S+@\S+\.\S+\z/}
  validates               :encrypted_password, length: {in: 6..15}, presence: true
  validates               :family_name,        presence: true
  validates               :first_name,         presence: true
  validates               :family_name_kana,   presence: true
  validates               :first_name_kana,    presence: true
  validates               :birthday,           presence: true
  validates               :phone_number,       length: {in: 10..11}, presence: true



  # associate
  has_one                       :address,     inverse_of: :user
  accepts_nested_attributes_for :address
  has_one                       :credit_card, inverse_of: :user
  has_many                      :products
  has_many                      :comments,    dependent: :destroy
  has_many                      :nices,       dependent: :destroy
  has_many                      :evaluations, dependent: :destroy


end
