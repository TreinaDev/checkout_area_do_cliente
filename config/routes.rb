Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :plans
  root to: 'home#index'
end
