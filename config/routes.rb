Rails.application.routes.draw do
  devise_for :installs
  devise_for :users
#   get 'toppage/index'
  get 'users/new'
  # get 'deteils/index'
  root "toppage#index"
  # root "deteils#index"
end

