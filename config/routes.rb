Rails.application.routes.draw do
  get 'toppage/index'

  root "toppage#index"
end
