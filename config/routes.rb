Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'products#index'

  resources :products

  resources :carts do
    resources :payments, only: [:new, :create]
    resources :orders, only: [:new, :create]
  end
end
