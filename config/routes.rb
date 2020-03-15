Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"
  get 'users/new'

  root 'items#index'
  resources :items, only: [:index, :show, :new, :edit, :destroy], except: :show do
  # Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: {format: 'json'}
      get 'get_size',defaults: {format: 'json'}
    end
  end
end
