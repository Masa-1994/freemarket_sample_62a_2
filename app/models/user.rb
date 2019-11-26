class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
          :omniauthable, omniauth_providers: %i[facebook google_oauth2]
          VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

          # step1入力項目
          validates :nickname,                presence: true, length: {maximum: 20}
          validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
          validates :password,                presence: true, length: {minimum: 6, maximum: 128}
          validates :password_confirmation,   presence: true, length: {minimum: 6, maximum: 128}
          validates :family_name,             presence: true
          validates :first_name,              presence: true
          validates :family_name_kana,        presence: true
          validates :first_name_kana,         presence: true
          validates :birthday_year,           presence: true
          validates :phone_number,            presence: true
  # associate
  has_one                       :address,         inverse_of: :user
  accepts_nested_attributes_for :address
  has_many                      :credit_card 
  has_many                      :products
  has_many                      :comments,        dependent: :destroy
  has_many                      :nices,           dependent: :destroy
  has_many                      :evaluations,     dependent: :destroy
  has_many                      :sns_credentials, dependent: :destroy

  #omniauth_callbacks_controllerで呼び出すメソッド
  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first #firstをつけないとデータが配列で返されて使いたいメソッドが使えなくて困る

    #sns_credentialsが登録されている
    if snscredential.present?
      user = User.where(email: auth.info.email).first

      # userが登録されていない
      unless user.present?
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
      end
      sns = snscredential
      #返り値をハッシュにして扱いやすくする  
      #活用例 info = User.find_oauth(auth) 
            #session[:nickname] = info[:user][:nickname]
      { user: user, sns: sns}

    #sns_credentialsが登録されていない
    else
      user = User.where(email: auth.info.email).first


      # userが登録されている
      if user.present?
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )

        { user: user, sns: sns}

      # userが登録されていない
      else
        user = User.new(
        nickname: auth.info.name,
        email: auth.info.email,
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )

        { user: user, sns: sns}
      end
    end
  end
end
