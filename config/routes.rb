Rails.application.routes.draw do
  root 'products#index'

  resources :products do
    resources :orders
  end
end
