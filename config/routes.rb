Rails.application.routes.draw do

  resources :cars
  # devise auto generate
  devise_for :users

  authenticated do
    root to: 'cars#index', as: :authenticated
  end

  root to: 'landingpage#index'

end
