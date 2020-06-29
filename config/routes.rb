Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients
  resources :plans, only: [:index]
  resources :orders, only: [:index]
	resources :aproveds, only: [:new, :create]
  root to: 'home#index'
end
