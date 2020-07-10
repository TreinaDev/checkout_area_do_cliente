Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients
  
  resources :plans, only: [:index]
  resources :approved_orders, only: %i[index show] do
    resources :cancel_bot_clients, only: %i[show new create]
  end

  resources :order_clients, only: %i[index show] do
    resources :approved_orders, only: %i[create]
    resources :rejected_orders, only: %i[new create]
  end
  root to: 'home#index'
  resources :companies, only: %i[show new create edit update] do
    get 'orders', on: :collection
  end
  namespace :client do
    resources :order_clients, only: %i[index show create] do
      post 'cancel', on: :member
    end
  end
  resources :plans, only: [:index]
  resources :promos, only: %i[index new create] do
    post 'approve', on: :member
  end
end
