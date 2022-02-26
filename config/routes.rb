Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :books do
    resources :swaps
    resources :reviews, except: [:destroy]
  end
  resources :users, only: [:show]
  resources :reviews, only: [:destroy]
  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
