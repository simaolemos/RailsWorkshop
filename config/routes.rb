Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts

  get 'profile/:username', to: 'profile#index', as: 'profile'

  root to: 'timeline#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
