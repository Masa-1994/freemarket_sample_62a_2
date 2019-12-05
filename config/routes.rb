Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  #商品一覧ページ
  root "products#index"

  #商品関連情報
  resources :products do
    member do
      get :buy              #商品購入
      patch :purchase       #payjp
      get :complete         #購入完了
    end
    collection do
      get 'category_children',defaults: { format: 'json' }             #子カテゴリー選択
      get 'category_grandchildren',defaults: { format: 'json' }        #孫カテゴリー選択
    end
  end

  #ユーザー関連情報
  resources :users, only: [:show] do
    member do
      get :login            #ログイン
      get :logout           #ログアウト
      get :profile          #プロフィール
      get :payment          #支払い方法
      get :credit           #クレジットカード情報入力
      get :identification   #本人情報
    end
  end
  
  #ユーザー新規登録
  resources :signup do
    collection do
      get 'step1'           #会員情報入力
      get 'step2'           #電話番号の確認
      get 'step2_5'         #電話番号認証
      get 'step3'           #発送元・お届け先住所入力
      get 'done'            #登録完了後のページ
    end
  end

  #クレジットカード登録 *payjp*
  resources :cards, only: [:new,:create]

end
