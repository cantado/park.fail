Rails.application.routes.draw do

  # devise auto generate
  devise_for :users

  # set root directory
  root to: 'home#index'

end
