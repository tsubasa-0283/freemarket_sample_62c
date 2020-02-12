Rails.application.routes.draw do
  get 'items/sell'

  get 'toppage/index'

  root "toppage#index"


  get 'items/sell'
end
