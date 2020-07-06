Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

  root to: 'home#index'
  resources :companies, only: %i[show new create edit update] do
    get 'orders', on: :collection
  end
  resources :orders, only: %i[show create]
  resources :plans, only: [:index]
  resources :orders, only: %i[show create]
  resources :promo, only: [:new, :create]
end
