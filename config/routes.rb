Rails.application.routes.draw do
  get 'deteils/index'

  # get 'toppage/index'

  # root "toppage#index"
  root "deteils#index"
end