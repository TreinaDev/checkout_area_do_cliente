Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

  root to: 'home#index'
  resources :companies, only: %i[show new create edit update]

  namespace :client do
    resources :orders, only: %i[index show create] do
      post 'cancel', on: :member
    end
  end

  resources :orders, only: %i[index show]

  resources :plans, only: [:index]
  resources :promos, only: %i[index new create]
end
