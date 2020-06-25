Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

  root to: 'home#index'

  resources :orders, only: %i[show create]
end
