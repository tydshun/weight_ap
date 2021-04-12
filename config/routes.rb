Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
 
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
