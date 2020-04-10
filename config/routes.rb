Rails.application.routes.draw do
  devise_for :users
  resources :toppages, only:[:index, :show, :new, :edit, :destroy] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  root "toppages#index"
  get 'users/new'

  root 'items#index'
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


  resources :items, except: :show
  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
