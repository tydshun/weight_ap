Rails.application.routes.draw do
  devise_for :users
 
  root to: 'tweets#index'
  devise_for :users
  # resources :blogs
  # resources :users
  # resources :weights
end
