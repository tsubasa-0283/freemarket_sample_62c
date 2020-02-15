Rails.application.routes.draw do
  get 'items/sell'

  get 'toppage/index'

  root "toppage#index"


  get 'items/sell'
end
=======
  get 'deteils/index'

  # get 'toppage/index'

  # root "toppage#index"
  root "deteils#index"
end
