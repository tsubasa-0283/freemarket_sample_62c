Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"
  get 'users/new'
  root 'items#index'
  resources :items, except: :show
end
