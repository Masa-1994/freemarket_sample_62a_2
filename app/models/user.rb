class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates               :nickname,         length: { in: 1..15, message: 'は1〜15文字で記入してください'}, presence: true
  validates               :email,            length: { maximum: 50, too_long: 'は50文字以内で記入してください'}, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "は「***@***.***」で登録してください"}
  validates_uniqueness_of :email,            message: 'は既に登録されています' 
  validates               :password,         length: { in: 6..15, message: '6〜15文字で記入してください'}, presence: true
  validates               :family_name,      presence: true
  validates               :first_name,       presence: true
  validates               :family_name_kana, presence: true
  validates               :first_name_kana,  presence: true
  validates               :phone_number,     presence: true
  validates_uniqueness_of :phone_number,     message: 'は既に登録されています'


  # associate
  has_one                       :address,     inverse_of: :user
  accepts_nested_attributes_for :address
  has_one                       :credit_card, inverse_of: :user
  has_many                      :products
  has_many                      :comments,    dependent: :destroy
  has_many                      :nices,       dependent: :destroy
  has_many                      :evaluations, dependent: :destroy


end
