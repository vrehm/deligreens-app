Rails.application.routes.draw do
  devise_for :users
  mount Attachinary::Engine => "/attachinary"

  resources :users, only: [:show]
  get 'users/dashboard/:id', to: 'users#dashboard', as: :dashboard

  resources :products, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      patch 'toggle_publish'
    end
  end

  root to: 'pages#home'
end
