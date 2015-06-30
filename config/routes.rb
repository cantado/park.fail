Rails.application.routes.draw do

  # devise auto generate
  devise_for :users

  authenticated do
    root to: 'park#index', as: :authenticated
  end

  root to: 'landingpage#index'

end
