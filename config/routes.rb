Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
#   root "toppage#index"
#   get 'toppage/index'
  get 'users/new'
  get 'deteils/index'
  # get 'toppage/index'
  # root "toppage#index"
  root "deteils#index"
end
