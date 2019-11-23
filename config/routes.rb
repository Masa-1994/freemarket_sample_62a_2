Rails.application.routes.draw do

  devise_for :users
  root "products#index"

  #商品関連情報
  resources :products, only: [:index,:new,:create,:show] do
    member do
      get :buy              #商品購入
    end
    collection do
      get 'category_children',defaults: { format: 'json' }             #子カテゴリー選択
      get 'category_grandchildren',defaults: { format: 'json' }    #孫カテゴリー選択
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
      get 'step3'           #電話番号認証
      get 'step4'           #発送元・お届け先住所入力
      get 'step5'           #支払い方法
      get 'done'            #登録完了後のページ
    end
  end
end
