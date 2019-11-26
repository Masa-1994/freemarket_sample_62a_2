class CardsController < ApplicationController

  require "payjp"
  before_action :set_card


  def new # カードの登録画面。送信ボタンを押すとcreateアクションへ。
    creditcard = CreditCard.where(user_id: current_user.id).first
    redirect_to "/cards/new" if creditcard.present?
  end

  # indexアクションはここでは省略

#PayjpとCardのデータベースを作成----------------------------------------------------------------------------------------------

  def create
    Payjp.api_key = 'sk_test_96c344952e792691d9fc840e'    #Pay.jpの秘密鍵

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: current_user.family_name + current_user.first_name,  #PAY.JPの顧客情報に表示する名前です。
        email: current_user.email,                                        #PAY.JPの顧客情報に表示するemailです。
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: current_user.id}                              # 無くてもOK。
      )
      @creditcard = CreditCard.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @creditcard.save
        redirect_to "/signup/done"
      else
        redirect_to action: "create"
      end
    end
  end

  private

  def set_card
    @creditcard = CreditCard.where(user_id: current_user.id).first if CreditCard.where(user_id: current_user.id).present?
  end
end