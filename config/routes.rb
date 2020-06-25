Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients
  resources :plans
  root to: 'home#index'
end
