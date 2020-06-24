Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

  root to: 'home#index'  
  resources :companies, only: %i[new create show]
end
