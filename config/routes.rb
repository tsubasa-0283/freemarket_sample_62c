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
  end

  root "toppages#index"

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
