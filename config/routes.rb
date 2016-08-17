Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  resources :users, only: [:show]

  resources :products, only: [:index, :show, :new, :create, :edit, :update]

  root to: 'pages#home'
end
