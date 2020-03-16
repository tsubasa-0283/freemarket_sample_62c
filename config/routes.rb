Rails.application.routes.draw do
  get 'users/top'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions      => 'users/sessions',
  }

  devise_scope :user do
    get  'users/sign_up' => 'users/registrations#new'
    post 'users/sign_up' => 'users/registrations#create'
  end

  root 'toppage#index'
end