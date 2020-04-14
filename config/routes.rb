Rails.application.routes.draw do
  devise_for :users, skip: :all, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/signup', to: 'users/registrations#step1'
    post 'users/signup/sms', to: 'users/registrations#step2'
    post 'users/signup/address', to: 'users/registrations#step3'
    post 'users/signup/create', to: 'users/registrations#create'

  end

  as :user do
    get 'users/sign_in', to: 'users/sessions#new'
    post 'users/sign_in', to: 'users/sessions#create'
    delete 'users/sign_out', to: 'users/sessions#destroy'
  end

  resources :toppages, only:[:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  root "toppages#index"
  get 'buyers/index'
  get 'buyers/done'
  get 'cards/new'
  get 'cards/show'

  devise_for :users
  resources :toppages, only:[:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  root "toppages#index"
  get 'users/new'

  #mypage関連
  resources :users do
    collection do
      get 'logout'
      get 'myPage'
    end
  end

  # root 'items#index'
  resources :items do
  # Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
    end
    collection do
      get ':id/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get ':id/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end


  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
  resources :items do
    resources :buyers, only: [:index] do
      collection do
        get 'done', to: 'buyers#done'
        post 'pay', to: 'buyers#pay'
      end
    end
  end
  get "mypages/index"
  get "mypages/logout"
end
