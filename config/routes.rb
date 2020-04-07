Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'users/signup', to: 'users/registrations#step1'
    post 'users/signup/sms', to: 'users/registrations#step2'
    post 'users/signup/address', to: 'users/registrations#step3'
    get 'users/signup/done', to: 'users/registrations#done'
    # get 'users/sign_in', to: 'users/sessions#new'
    # post 'users/sign_in', to: 'users/sessions#create'
    # delete 'users/sign_out', to: 'users/sessions#destroy'
  end

  as :user do
    get 'users/sign_in', to: 'devise/sessions#new'
    post 'users/sign_in', to: 'devise/sessions#create'
    delete 'users/sign_out', to: 'devise/sessions#destroy'
  end

  root "toppages#index"

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
  end


end
