Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books do
    resources :reviews, except: [:destroy, :update, :edit]
    resources :swaps, only: [:new, :create]
  end
  resources :swaps, only: [:update]
  resources :user_book_relationships
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]
  namespace :current_user do
    resources :swaps, only: [:index, :update]
  end
  resources :chatrooms, only: [:show, :new, :create] do
    resources :messages, only: :create
  end
  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
