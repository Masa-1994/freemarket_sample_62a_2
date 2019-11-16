Rails.application.routes.draw do
  root "products#index"
  resources :products, only: [:index,:new,:create,:show] do
    member do
      get :buy
    end
  end

  resources :users, only: [:index, :new, :edit]
  
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5'# ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
end
