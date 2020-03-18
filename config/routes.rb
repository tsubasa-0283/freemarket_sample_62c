Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end


  get '/addresses/new', to: 'addresses#step3'
  get '/cards/new', to: 'cards#step4'
  get '/signup/done', to: 'signup#done'

  # resources :signup do
  #   collection do
  #     get 'index'
  #     get 'done'
  #   end
  # end

  # devise_for :users
  root "toppages#index"
  # get 'users/new'

  root 'items#index'
  resources :items do
  # Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
    end
  end


  resources :items, except: :show
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
