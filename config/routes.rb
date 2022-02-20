Rails.application.routes.draw do
  get 'users/edit'
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users
  resources :rooms
  resources :reservations
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
