Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
#   root "toppage#index"
#   get 'toppage/index'
  # get 'users/new'
  # get 'items/show'
  # get 'toppage/index'
  # root "toppage#index"
  root "deteils#index"

  root 'items#index'
  resources :items, except: :show
end
