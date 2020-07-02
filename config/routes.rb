Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

  root to: 'home#index'
  resources :companies, only: %i[show new create edit update]
  resources :orders, only: %i[index show create] do
    get 'cancel', on: :member
  end
  resources :plans, only: [:index]
  resources :promos, only: %i[index new create]
end
