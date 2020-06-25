Rails.application.routes.draw do
  devise_for :employees
  devise_for :clients

<<<<<<< HEAD
  root to: 'home#index'
  resources :companies, only: %i[show new create]
=======
  root to: 'home#index'  
  resources :companies, only: %i[new create show]
>>>>>>> b6d2cca56d72ba72aa5c87072550ddc245b9848b
end
