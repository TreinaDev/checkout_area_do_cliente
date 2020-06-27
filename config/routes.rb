Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients
  resources :plans, only: [:index]
  resources :orders, only: [:index, :checked]
  root to: 'home#index'
end
