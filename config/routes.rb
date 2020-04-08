Rails.application.routes.draw do
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

  root 'items#index'
  resources :items do
  # Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
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
end
