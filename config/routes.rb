Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :accounts  do
    resources :holdings, only: [:new, :create, :edit, :update]
    resources :goals, only: [:new, :create, :edit, :update]
  end
    resources :holdings, only: [:destroy]
    resources :goals, only: [:destroy]
    resources :stocks, only: [:new, :create, :edit, :update]
end
