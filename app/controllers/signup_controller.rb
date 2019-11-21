class SignupController < ApplicationController

  def index
  end

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # session[:nickname] = user_params[:nickname]
    # session[:email] = user_params[:email]
    # session[:pasword] = user_params[:pasword]
    # session[:family_name] = user_params[:family_name]
    # session[:first_name] = user_params[:first_name]
    # session[:family_name_kana] = user_params[:family_name_kana]
    # session[:first_name_kana] = user_params[:first_name_kana]
    # session[:birthday_year] = user_paeams[:birthday_year]

    @user = User.new
  end

  def step3
  end

  def step4
  end

  def step5
  end

  def done
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :birthday_year,
      :phone_number,
      
    )
  end
end
