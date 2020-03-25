Rails.application.routes.draw do
  get 'cards/new'
  get 'cards/show'

  devise_for :users
  root "toppages#index"
  get 'users/new'
  root 'items#index'

  resources :items, except: :show
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end
