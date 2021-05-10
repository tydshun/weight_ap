Rails.application.routes.draw do
  get 'blogs/index'
  devise_for :users
  resources :users, :only => [:show, :edit, :update]
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
 
  root to: 'tweets#index'
  resources :blogs

  resources :tweets do
    collection do
      get 'tweets'
      get 'search'
    end
    resources :comments, only: [:create,:update,:destroy,:edit]
  end

  # resources :blogs
  resources :weights do
    collection do
      get 'bmi'
      get 'month'
      get 'three_month'
      get 'six_month'
    end
  end
end
