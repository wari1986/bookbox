Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books do
    resources :reviews, except: [:destroy]
  end
  resources :swaps, only: [:update]
  resources :user_book_relationships do
    resources :swaps, only: [:new, :create]
  end
  resources :users, only: [:show, :index]
  resources :reviews, only: [:destroy]
  namespace :current_user do
    resources :swaps, only: [:index]
  end
  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
