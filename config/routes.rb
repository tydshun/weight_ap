Rails.application.routes.draw do
  devise_for :users
 
  root to: 'tweets#index'

  resources :tweets do
    collection do
      get 'tweets'
      get 'search'
    end
  end

  # resources :blogs
  # resources :users
  # resources :weights
end
