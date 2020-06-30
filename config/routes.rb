Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients
  resources :plans, only: [:index]
  resources :order_clients, only: [:index, :show] do
	  resources :approved_orders, only: [:create]
  end
  root to: 'home#index'
end
