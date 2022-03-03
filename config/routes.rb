Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'rooms/search' => 'rooms#search'

  resources :reservations do
    member do
      post "confirm"
      post "back"
      get "comprete"
    end
  end

  resources :users
  resources :rooms 
  resources :reservations

  get 'users/show'
  get 'users/edit'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
