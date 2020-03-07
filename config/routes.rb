Rails.application.routes.draw do
  devise_for :users
  root "toppages#index"
#   get 'toppage/index'
  get 'users/new'
  # get 'deteils/index'
  # get 'toppage/index'
  # root "toppage#index"
  # root "deteils#index"

  root 'items#index'
  resources :items, except: :show
end
