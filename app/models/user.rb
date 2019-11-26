class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

          # step1入力項目
          validates :nickname,                presence: true, length: {maximum: 20}, on: :validates_step1
          validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }, on: :validates_step1
          validates :password,                presence: true, length: {minimum: 6, maximum: 128}, on: :validates_step1
          validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128}, on: :validates_step1
          validates :family_name,             presence: true, on: :validates_step1
          validates :first_name,              presence: true, on: :validates_step1
          validates :family_name_kana,        presence: true, on: :validates_step1
          validates :first_name_kana,         presence: true, on: :validates_step1
          validates :birthday_year,           presence: true, on: :validates_step1
          validates :phone_number,            presence: true, on: :validates_step2
  # associate
  has_one                       :address,     inverse_of: :user
  accepts_nested_attributes_for :address
  has_many                      :credit_card
  has_many                      :products
  has_many                      :comments,    dependent: :destroy
  has_many                      :nices,       dependent: :destroy
  has_many                      :evaluations, dependent: :destroy


end
