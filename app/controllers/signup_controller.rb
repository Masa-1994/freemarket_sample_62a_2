class SignupController < ApplicationController

  before_action :validates_step1, only: :step2   # step1のバリデーション
  before_action :validates_step2, only: :step3   # step2のバリデーション
  before_action :validates_step3, only: :create  # step2のバリデーション

  # 新規会員登録-email-FaceBook-Google-
  def index
  end

  # 会員情報入力
  def step1
    @user = User.new # 新規インスタンス作成
  end

  # 電話番号の確認
  def step2
    @user = User.new # 新規インスタンス作成
  end

  # 発送元・お届け先住所入力
  def step3
    @user = User.new # 新規インスタンス作成
    @user.build_address
    @address = Address.new
  end

  # 登録完了
  def done
  end

# 会員情報入力(STEP1)--------------------------------------------------------------------------------------------------

  def validates_step1
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:family_name] = user_params[:family_name]
    session[:first_name] = user_params[:first_name]
    session[:family_name_kana] = user_params[:family_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:birthday_year] = user_params["birthday_year(1i)"] + "-" + user_params["birthday_year(2i)"] + "-" + user_params["birthday_year(3i)"]
    
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      phone_number: '09012345678'
    )
    render "/signup/step1" unless @user.valid? && verify_recaptcha(model: @user)   #sessionに対してのバリデーション
  end

# 電話番号の確認(STEP2)-----------------------------------------------------------------------------------------------

  def validates_step2
    session[:phone_number] = user_params[:phone_number]
    
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      phone_number: session[:phone_number]
    )
    render "/signup/step2" unless @user.valid?    #sessionに対してのバリデーション
  end

# 発送元・お届け先住所入力(STEP3)----------------------------------------------------------------------------------------

  def validates_step3
    session[:user_id] = user_params[:address_attributes][:id]
    session[:address_family_name] = user_params[:address_attributes][:family_name]
    session[:address_first_name] = user_params[:address_attributes][:first_name]
    session[:address_family_name_kana] = user_params[:address_attributes][:family_name_kana]
    session[:address_first_name_kana] = user_params[:address_attributes][:first_name_kana]
    session[:address_postal_code] = user_params[:address_attributes][:postal_code]
    session[:address_prefecture_id] = user_params[:address_attributes][:prefecture_id]
    session[:address_municipalities] = user_params[:address_attributes][:municipalities]
    session[:address_house_number] = user_params[:address_attributes][:house_number]

    @user = User.new(
      email: 'www@gmail.com',
      password: '12345678'
    )
    @address = Address.new(
      family_name: session[:address_family_name],
      first_name: session[:address_first_name],
      family_name_kana: session[:address_family_name_kana],
      first_name_kana: session[:address_first_name_kana],
      postal_code: session[:address_postal_code],
      prefecture_id: session[:address_prefecture_id],
      municipalities: session[:address_municipalities],
      house_number: session[:address_house_number],
    )
    render "/signup/step3" unless @address.valid?    #sessionに対してのバリデーション
  end

# sessionのデータをデータベースに保存する----------------------------------------------------------------------------------

  def create
    # usersテーブルに値を入れる
    @user = User.new(
      nickname: session[:nickname], 
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      family_name: session[:family_name],
      first_name: session[:first_name],
      family_name_kana: session[:family_name_kana],
      first_name_kana: session[:first_name_kana],
      birthday_year: session[:birthday_year],
      phone_number: session[:phone_number],
    )
    # addressテーブルに値を入れる
    @user.build_address(
      family_name: session[:address_family_name],
      first_name: session[:address_first_name],
      family_name_kana: session[:address_family_name_kana],
      first_name_kana: session[:address_first_name_kana],
      postal_code: session[:address_postal_code],
      prefecture_id: session[:address_prefecture_id],
      municipalities: session[:address_municipalities],
      house_number: session[:address_house_number],
    )
    if @user.save   #データベースへの保存
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in? # 自動ログイン
      redirect_to "/cards/new" #データベースに保存されれば、クレジットカード登録ページに移動する
    else
      render '/signup/step3'   #データベースに保存されなければ,会員情報入力(STEP3)からやり直し
    end
  end

  #新規登録ページのformデータを取得--------------------------------------------------------------------------------------

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      "birthday_year(1i)",
      "birthday_year(2i)",
      "birthday_year(3i)",
      :phone_number,
      address_attributes: [:id, :family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number]
    )
  end


end