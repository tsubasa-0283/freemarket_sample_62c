Rails.application.routes.draw do
  devise_for :users
  root "toppage#index"
  get 'toppage/index'
  get 'users/new'
end
