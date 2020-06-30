Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

  root to: 'home#index'
  resources :companies, only: %i[show new create]
  resources :orders, only: %i[show create]
  resources :plans, only: [:index]
  resources :promo, only: [:new, :create]
end
