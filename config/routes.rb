Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  resources :products, only: [:index, :show, :new, :create, :edit, :update]

  root to: 'pages#home'
end
